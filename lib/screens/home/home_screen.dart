import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiitcart_tasks/constants.dart';
import 'package:kiitcart_tasks/screens/home/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            color: Colors.white,
          ),
        ),
      ),
      body: HomeBody(
        user: user,
      ),
    );
  }
}
