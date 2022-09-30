import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiitcart_tasks/constants.dart';
import 'package:kiitcart_tasks/screens/login_sign_up/sign_up_screen.dart';

import '../screens/home/home_screen.dart';

signInWithGoogle(
    {bool link = false,
    AuthCredential? authCredential,
    required BuildContext context}) async {
  final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    try {
      showDialog(
          context: context,
          builder: (context) => const Center(
                  child: CircularProgressIndicator(
                color: kPrimaryColor,
              )));
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (link) {
        await userCredential.user!.linkWithCredential(authCredential!);
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: userCredential.user!,
                  )),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          backgroundColor: kPrimaryColor,
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 700),
        content: Text(
          "Select an account please",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

signInWithFacebook(BuildContext context) async {
  final LoginResult loginResult = await FacebookAuth.instance.login();
  final OAuthCredential credential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  try {
    showDialog(
        context: context,
        builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            )));
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(user: userCredential.user!)),
        (route) => false);
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    if (e.code == 'account-exists-with-different-credential') {
      List<String> emailList =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(e.email!);
      if (emailList.first == "google.com") {
        await signInWithGoogle(
            link: true, authCredential: e.credential, context: context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "This Email is already being used",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            backgroundColor: kPrimaryColor,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          backgroundColor: kPrimaryColor,
        ),
      );
    }
  }
}

signOut(BuildContext context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  showDialog(
      context: context,
      builder: (context) => const Center(
              child: CircularProgressIndicator(
            color: kPrimaryColor,
          )));
  try {
    final _providerData = _auth.currentUser!.providerData;
    if (_providerData.isNotEmpty) {
      if (_providerData[0].providerId.toLowerCase().contains('google')) {
        await GoogleSignIn().signOut();
      } else if (_providerData[0]
          .providerId
          .toLowerCase()
          .contains('facebook')) {
        await FacebookAuth.instance.logOut();
      }
    }

    await _auth.signOut();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
        (route) => false);
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
