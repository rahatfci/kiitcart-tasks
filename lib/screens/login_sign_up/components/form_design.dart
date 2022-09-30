import 'package:flutter/material.dart';
import 'package:kiitcart_tasks/constants.dart';

Widget topStyle(BuildContext context) {
  return Container(
    height: 350,
    color: kPrimaryColor,
    width: MediaQuery.of(context).size.width,
  );
}

Widget welcomeText() {
  return const Positioned(
      top: 80,
      left: 20,
      child: Text(
        "Sign In !",
        style: TextStyle(color: Colors.white, fontSize: 24),
      ));
}

Widget gLogin({required String text}) {
  return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF4285F4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Image.asset(
              "assets/g-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ],
      ));
}

Widget fbLogin({required String text}) {
  return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF0072E7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 10),
            child: Image.asset(
              "assets/f-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ],
      ));
}
