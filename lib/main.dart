import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'common_dice.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {

  var dice1 = 1;
  var dice2 = 1;
  var isRolling = false;
  var text = "Roll the dice";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Dice App"),
        ),
        body: Container(
          color: Colors.redAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [DiceWidget(num: dice1), DiceWidget(num: dice2)],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    text, // "You rolled a $dice1 and a $dice2 !",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!isRolling) {
              setState(() {
                isRolling = true;
              });
              int iterations = 0;
              Timer.periodic(const Duration(milliseconds: 500), (timer) {
                setState(() {
                  dice1 = Random().nextInt(6) + 1;
                  dice2 = Random().nextInt(6) + 1;
                });
                iterations++;
                if (iterations >= 5) {
                  text = "You rolled a $dice1 and a $dice2 !";
                  timer.cancel();
                  setState(() {
                    isRolling = false;
                  });
                }
              });
            }
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.redAccent,
          child: const Text("Roll"),
        ),
      ),
    );
  }
}
