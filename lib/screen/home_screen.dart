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
              child: Text('1 + 1 = ?', style: whiteTextStyle),
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
                return MyButton(child: numberPad[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
