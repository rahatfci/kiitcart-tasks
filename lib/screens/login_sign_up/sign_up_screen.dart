import 'package:flutter/material.dart';

import 'body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: const SignUpBody(),
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      ),
    );
  }
}
