import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:num_game/screens/game_screen.dart';

import 'custom_page.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animationController.repeat();
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScreen(
        animationController: animationController,
        childWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Developed by Saqib Salim",
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "How many times can you guess?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              splashColor: Colors.white,
              onTap: () {
                Get.to(
                  const GameScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(seconds: 1),
                );
              },
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                      color: Colors.blue.withOpacity(0.75), width: 0.5),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20,
                          sigmaY: 20,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, letterSpacing: 5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
