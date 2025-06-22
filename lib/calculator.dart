import 'dart:math';
import 'package:flutter/material.dart';

import 'custom_btn.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resultText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Calculator',style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  resultText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    CustomBtn(
                                      txt: 'x²',
                                      onPressed: onPowerOfTwoClick,
                                      bgColor: Color(0xff616161),
                                      txtColor: Color(0xffA5A5A5),
                                    ),
                                    CustomBtn(
                                      txt: 'AC',
                                      onPressed: onClear,
                                      bgColor: Color(0xff616161),
                                      txtColor: Color(0xffA5A5A5),
                                    ),
                                    CustomBtn(
                                      txt: 'DEL',
                                      isBackspace: true,
                                      txtColor: Color(0xffA5A5A5),
                                      bgColor: Color(0xff616161),
                                      onPressed: onBackspaceClick,
                                    ),

                                    CustomBtn(
                                      txt: '/',
                                      onPressed: onClickedOperator,
                                      bgColor: Color(0xff005DB2),
                                      txtColor: Color(0xff339DFF),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    CustomBtn(
                                      txt: '7',
                                      onPressed: onDigitClick,
                                    ),

                                    CustomBtn(
                                      txt: '8',
                                      onPressed: onDigitClick,
                                    ),

                                    CustomBtn(
                                      txt: '9',
                                      onPressed: onDigitClick,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    CustomBtn(
                                      txt: '4',
                                      onPressed: onDigitClick,
                                    ),
                                    CustomBtn(
                                      txt: '5',
                                      onPressed: onDigitClick,
                                    ),

                                    CustomBtn(
                                      txt: '6',
                                      onPressed: onDigitClick,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    CustomBtn(
                                      txt: '1',
                                      onPressed: onDigitClick,
                                    ),
                                    CustomBtn(
                                      txt: '2',
                                      onPressed: onDigitClick,
                                    ),

                                    CustomBtn(
                                      txt: '3',
                                      onPressed: onDigitClick,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    CustomBtn(
                                      txt: '0',
                                      flex: 2,
                                      onPressed: onDigitClick,
                                    ),
                                    CustomBtn(
                                      txt: '.',
                                      flex: 1,
                                      onPressed: onDotClick,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: CustomBtn(
                                  txt: '√',
                                  onPressed: onSquareRootClick,
                                  bgColor: Color(0xff005DB2),
                                  txtColor: Color(0xff339DFF),
                                ),
                              ),
                              Expanded(
                                child: CustomBtn(
                                  onPressed: onClickedOperator,
                                  txt: '*',
                                  bgColor: Color(0xff005DB2),
                                  txtColor: Color(0xff339DFF),
                                ),
                              ),
                              Expanded(
                                child: CustomBtn(
                                  onPressed: onClickedOperator,
                                  txt: '-',
                                  bgColor: Color(0xff005DB2),
                                  txtColor: Color(0xff339DFF),
                                ),
                              ),
                              Expanded(
                                child: CustomBtn(
                                  onPressed: onClickedOperator,
                                  txt: '+',
                                  bgColor: Color(0xff005DB2),
                                  txtColor: Color(0xff339DFF),
                                ),
                              ),
                              Expanded(
                                child: CustomBtn(
                                  onPressed: onEqualClick,
                                  txt: '=',
                                  bgColor: Color(0xff1991FF),
                                  txtColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String digit) {
    resultText += digit;
    setState(() {});
  }

  String lhs = '';
  String operator = '';

  void onClickedOperator(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resultText;
    } else {
      String rhs = resultText;
      lhs = calculate(lhs, operator, rhs);
    }
    operator = clickedOperator;
    resultText = '';
    setState(() {});
  }

  void onEqualClick(String txt) {
    String rhs = resultText;
    resultText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClear(String txt) {
    resultText = '';
    setState(() {});
  }

  void onBackspaceClick(String txt) {
    if (resultText.isNotEmpty) {
      resultText = resultText.substring(0, resultText.length - 1);
    }
    setState(() {});
  }

  void onDotClick(String txt) {
    if (!resultText.contains('.')) {
      resultText += '.';
    }
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double dlhs = double.parse(lhs);
    double drhs = double.parse(rhs);
    double result = 0;
    switch (operator) {
      case '+':
        result = dlhs + drhs;
        break;
      case '-':
        result = dlhs - drhs;
        break;
      case '*':
        result = dlhs * drhs;
        break;
      case '/':
        result = dlhs / drhs;
        break;
      default:
        break;
    }
    if (result.toInt() == result) {
      return result.toInt().toStringAsFixed(1);
    }
    return result.toStringAsFixed(2);
  }

  void onSquareRootClick(String txt) {
    if (resultText.isNotEmpty) {
      double value = double.parse(resultText);
      if (value >= 0) {
        double result=sqrt(value);
        if(result.toInt()==result)
        {
          resultText = (sqrt(value)).toStringAsFixed(1);
        }
        else {
          resultText = (sqrt(value)).toStringAsFixed(2);
        }

      } else {
        resultText = 'Error';
      }
      setState(() {});
    }
  }

  void onPowerOfTwoClick(String txt) {
    if (resultText.isNotEmpty) {
      double value = double.parse(resultText);
      resultText = (value * value).toString();
      setState(() {});
    }
  }
}
