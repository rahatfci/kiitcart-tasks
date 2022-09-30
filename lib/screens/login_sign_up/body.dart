import 'package:flutter/material.dart';
import 'package:kiitcart_tasks/screens/login_sign_up/components/form_design.dart';

import '../../authentication/auth.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);
  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        topStyle(context),
        const Positioned(
            top: 130,
            left: 20,
            child: Text(
              "Welcome to KiitCart ",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, letterSpacing: 1),
            )),
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 240, bottom: 8),
          shadowColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: gLogin(text: "Continue with Google"),
                    onTap: () async {
                      await signInWithGoogle(context: context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      child: fbLogin(text: "Continue with Facebook"),
                      onTap: () async {
                        await signInWithFacebook(context);
                      }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
