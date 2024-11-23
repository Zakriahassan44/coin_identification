import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import 'Screens/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late GifController gifController = GifController(vsync: this);

  @override
  void initState() {
    super.initState();
    gifController = GifController(vsync: this);
    gifController.repeat(period: const Duration(seconds: 9));
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 9));
    animation = Tween<double>(begin: 0.7, end: 1.5).animate(CurvedAnimation(
        parent: _animationController, curve: Easing.emphasizedAccelerate));
    _animationController.forward();
    Timer(const Duration(seconds: 9), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFF7043),
              Color(0xffFF7E5F),
              Color(0xffFEB47B),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                  scale: animation,
                  child: Gif(
                    width: 250,
                    height: 250,
                    image: const AssetImage("assets/animation/lottie.gif"),
                    controller: gifController,
                    autostart: Autostart.loop,
                    onFetchCompleted: () {
                      gifController.reset();
                      gifController.forward();
                    },
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            ScaleTransition(
              scale: animation,
              child: const Text(
                "COIN IDENTIFICATION",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Montserrat"),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Identify coins instantly with \n precision and ease",
              style: TextStyle(
                  fontSize: 14, color: Colors.white, fontFamily: "Montserrat"),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
