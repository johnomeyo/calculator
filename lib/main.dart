// ignore_for_file: prefer_const_constructors

import 'package:calculator_app/splash.dart';
import 'package:calculator_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

var question = " ";
var answer = "";

class _CalculatorState extends State<Calculator> {
  List<String> buttons = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(question,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(answer,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                    color: Colors.black,
                    child: GridView.builder(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Button(
                              tapFunction: () {
                                setState(() {
                                  question = "";
                                });
                              },
                              text: buttons[index],
                              color: Colors.grey.shade200,
                              textColor: Colors.black,
                            );
                          } else if (index == 1) {
                            return Button(
                              tapFunction: () {
                                setState(() {
                                  question = question.substring(
                                      0, question.length - 1);
                                });
                              },
                              text: buttons[index],
                              color: Colors.grey.shade200,
                              textColor: Colors.black,
                            );
                          } else if (index == 2) {
                            return Button(
                              tapFunction: () {
                                setState(() {
                                  question += buttons[index];
                                });
                              },
                              text: buttons[index],
                              color: Colors.grey.shade200,
                              textColor: Colors.black,
                            );
                          } else if (index == buttons.length - 1) {
                            return Button(
                              tapFunction: () {
                                setState(() {
                                  calculation();
                                });
                              },
                              text: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.deepOrange
                                  : Colors.grey.shade800,
                              textColor: Colors.white,
                            );
                          } else {
                            return Button(
                              tapFunction: () {
                                setState(() {
                                  question += buttons[index];
                                });
                              },
                              text: buttons[index],
                              color: isOperator(buttons[index])
                                  ? Colors.deepOrange
                                  : Colors.grey.shade800,
                              textColor: Colors.white,
                            );
                          }
                        }))),
          ],
        ),
      ),
    );
  }
}

void calculation() {
  String theQuestion = question;
  //we convert the x to * so that the parser reads it as a multiplaction
  //instead of a letter
  theQuestion = theQuestion.replaceAll("x", "*");
  //this is just direct in the documentation
  Parser p = Parser();
  Expression exp = p.parse(theQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  answer = eval.toString();
}

isOperator(String operator) {
  if (operator == "x" ||
      operator == "+" ||
      operator == "-" ||
      operator == "/" ||
      operator == "=" ||
      operator == "AC" ||
      operator == "%" ||
      operator == "DEL") {
    return true;
  }
  return false;
}
