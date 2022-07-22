import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text('Dice Roller'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 4;
  final ButtonStyle style =
      ElevatedButton.styleFrom(primary: Colors.deepPurple);

  int generateRandomNumber() {
    return Random().nextInt(6) + 1;
  }

  void changeDiceState() {
    rightDiceNum = generateRandomNumber();
    leftDiceNum = generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    changeDiceState();
                  });
                },
                style: style,
                child: Image(
                  image: AssetImage('images/dice$leftDiceNum.png'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    changeDiceState();
                  });
                },
                style: style,
                child: Image(
                  image: AssetImage('images/dice$rightDiceNum.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
