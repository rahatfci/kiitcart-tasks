import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../authentication/auth.dart';
import '../../constants.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.displayName!,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            user.email!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton.icon(
            onPressed: () => signOut(context),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                backgroundColor: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
