import 'dart:async';

import 'package:clothes_app_crud/pages/my_clothes_page.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyClothesPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple[50],
        child: Center(
          child: Text("Clothes CRUD App",
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: 36,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
                fontFamily: "Roboto",
              )),
        ));
  }
}
