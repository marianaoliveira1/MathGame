import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/util/my_botton.dart';
import 'package:mathgame/util/result_message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  int numberA = 1;
  int numberB = 1;

  String userAnswer = '';

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Acertou meu patrão',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Vish chefia, errou',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(numberA.toString() + ' + ' + numberB.toString() + ' = ',
                      style: whiteTextStyle),
                  Container(
                    height: 50,
                    width: 105,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: whiteTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: numberPad.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return MyButton(
                  child: numberPad[index],
                  onTap: () => buttonTapped(numberPad[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
