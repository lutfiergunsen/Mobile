import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "0";
  String res = "0";

  void logButtonPress(String buttonText) {
    debugPrint('Button pressed: $buttonText');
  }

  void buttonPressed(String buttonText) {
    logButtonPress(buttonText);

    void letstart(String displayText) {
      Parser p = Parser();
      Expression exp =
          p.parse(displayText); // displayText'teki işlemi parse eder

      ContextModel cm = ContextModel();
      double eval =
          exp.evaluate(EvaluationType.REAL, cm); // İşlemi değerlendirir
      setState(() {
        res = eval.toString();
      });
      print('Sonuç: $eval');
    }

    setState(() {
      if (buttonText == "AC") {
        displayText = "0";
        res = "0";
      } else if (buttonText == "C") {
        displayText = displayText.substring(0, displayText.length - 1);
      } else if (buttonText == "=") {
        letstart(displayText);
      } else {
        displayText += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, {Color textColor = Colors.white}) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          side: BorderSide(color: Colors.grey),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: textColor),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      displayText,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      res,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/", textColor: Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*", textColor: Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-", textColor: Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+", textColor: Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("C", textColor: Colors.red),
                  buildButton("AC", textColor: Colors.red),
                  buildButton("=", textColor: Colors.green),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
