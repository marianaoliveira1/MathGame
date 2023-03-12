import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/util/my_botton.dart';

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

  void checkResult() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.black,
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('1 + 1 = ', style: whiteTextStyle),
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
