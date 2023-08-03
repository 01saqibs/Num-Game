import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreDialog extends StatelessWidget {

  final int score;
  const ScoreDialog({
  super.key, required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              alignment: Alignment.center,
              width: 340,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.blue.withOpacity(0.50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "You Scored: $score",
                    style: const TextStyle(
                        color: Colors.white, fontSize: 30),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.blue.withOpacity(0.50)),
                      ),
                      child: const Text(
                        "Play Again",
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}