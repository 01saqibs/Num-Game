import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({
  super.key,
  required this.animationController, required this.childWidget,
  });

  final Widget childWidget;

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: -100, left: 0, right: 0,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 25, sigmaY: 25,),
              child: Transform.rotate(
                angle: animationController.value*2*pi,
                child: Container(
                  width: 500, height: 500,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.5,
                          0.9,
                        ],
                        colors: [
                          Color(0xFF000080),
                          Colors.blue,
                        ],
                      ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -200, left: 0,
            bottom: -10,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 25, sigmaY: 25,),
              child: Transform.rotate(
                angle: animationController.value*-2*pi,
                child: Container(
                  width: 500, height: 500,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.5,
                          0.9,
                        ],
                        colors: [
                          Color(0xFF000080),
                          Colors.blue,
                        ],
                      )
                  ),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50, sigmaY: 50
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: childWidget,
            ),
          )],
      ),
    );
  }
}