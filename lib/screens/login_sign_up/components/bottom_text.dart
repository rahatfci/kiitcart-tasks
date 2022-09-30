import 'package:flutter/material.dart';

import '../../../constants.dart';

Widget bottomText() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: "By submitting you are agreeing to\n",
          style: TextStyle(fontSize: 14, color: Colors.black, height: 1.2),
          children: [
            TextSpan(
                text: "terms and conditions",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold)),
            TextSpan(text: " & "),
            TextSpan(
                text: "privacy policy",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold))
          ]),
    ),
  );
}
