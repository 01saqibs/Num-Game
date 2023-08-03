
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:num_game/screens/custom_page.dart';
import 'package:num_game/utltis/score_dialog.dart';

import '../utltis/number_containers.dart';




class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  bool isStart = true;
  int score = 0;
  int count = 0;
  var listOfNumbers = [1,2,3,4,5,7,8,9];
  var getList = [];
  var random = Random();
  int element = 0;
  int element2 = 0;
  int elementA = 0;
  int elementB = 0;
  int elementC = 0;
  int sum = 0;
  int sum2 = 0;
  int sum3 = 0;

  void randomElement() {
    setState(() {
      element = listOfNumbers[random.nextInt(listOfNumbers.length)];
      element2 = listOfNumbers[random.nextInt(listOfNumbers.length)];
      getNumbers();
    });
  }

  void getNumbers(){
    sum = (element + element2);
    sum2 = (sum + 1);
    sum3 = (sum+2);
    getList.add(sum);
    getList.add(sum2);
    getList.add(sum3);
  }

  void getElement() {
    setState(() {
      // elementA = getList[random.nextInt(getList.length)];
      // elementB = getList[random.nextInt(getList.length)];
      // elementC = getList[random.nextInt(getList.length)];
      // if(elementA == elementB || elementA == elementC || elementB == elementA || elementB == elementC || elementC == elementA || elementC == elementB){
      //   getList.shuffle();
      //   elementA = getList[random.nextInt(getList.length)];
      //   elementB = getList[random.nextInt(getList.length)];
      //   elementC = getList[random.nextInt(getList.length)];
      // }
      elementA = getList.elementAt(0);
      elementB = getList.elementAt(1);
      elementC = getList.elementAt(2);
      getList.shuffle();
    });
  }


  void scoreIncrement() {
    score++;
    getList.clear();
  }

  void pressed(){
    scoreIncrement();
    randomElement();
    getElement();
  }

  void failed() {
    element = 0;
    element2 = 0;
    elementA = 0;
    elementB = 0;
    elementC = 0;
    sum = 0;
    score = 0;
    isStart = true;
    count = 0;

  }

  late AnimationController animationController;

  @override
  void initState() {
    failed();
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
        childWidget: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 100,),
                  const Text(
                    "Can you guess the number?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        numContainer(num: '$element'),
                        numContainer(num: isStart ? '0' : '+'),
                        numContainer(num: '$element2'),
                        numContainer(num: isStart ? '0' : '='),
                        numContainer(num: isStart ? '0' : '?'),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Score: $score',
                style: const TextStyle(color: Colors.white, fontSize: 20),),
              Column(
                children: [
                  const Text(
                    "Pick a number",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        pickContainer(num: '$elementA', onTap: () {
                          if (elementA == 0) {} else {
                            if (elementA == (sum)) {
                              pressed();
                            } else {
                              Get.dialog(ScoreDialog(score: score,));
                              failed();
                            }
                          }
                        }),
                        pickContainer(num: '$elementB', onTap: () {
                          if (elementB == 0) {} else {
                            if (elementB == (sum)) {
                              pressed();
                            } else {
                              Get.dialog(ScoreDialog(score: score,));
                              failed();
                            }
                          }
                        }),
                        pickContainer(num: '$elementC', onTap: () {
                          if (elementC == 0) {} else {
                            if (elementC == (sum)) {
                              pressed();
                            } else {
                              Get.dialog(ScoreDialog(score: score,));
                              failed();
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                  InkWell(
                    onTap: () {
                      randomElement();
                      getElement();
                      isStart = false;
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                            color: Colors.blue.withOpacity(0.75), width: 0.5),
                      ),
                      child: Text(
                        isStart ? "Start" : "None",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Text(
                    isStart
                        ? "Please tap on Start!"
                        : "Select none! in case of different answer",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(11),
                splashColor: Colors.white,
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                        "Exit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 5),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


