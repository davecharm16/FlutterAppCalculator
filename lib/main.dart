import 'package:calculatorapp/Calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

CalculatorBrain calc = CalculatorBrain();

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //Num Buttons
  Expanded calcNumButtons(String symbol) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: FlatButton(
          color: Colors.lightBlueAccent,
          onPressed: () {
            //TODO: Function here
            setState(() {
              calc.updateDisplay(symbol);
            });
          },
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //Symbol Button
  Expanded calcOperatorButtons(String symbol) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: FlatButton(
          color: Colors.pink,
          onPressed: () {
            //TODO: Function here
            setState(() {
              if (calc.getDisplay() != "") {
                calc.operationUpdate(symbol);
              }
            });
          },
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    calc.getDisplay(),
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                calcNumButtons("1"),
                calcNumButtons("2"),
                calcNumButtons("3"),
                calcOperatorButtons('C'),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                calcNumButtons("4"),
                calcNumButtons("5"),
                calcNumButtons("6"),
                calcOperatorButtons('+'),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                calcNumButtons("7"),
                calcNumButtons("8"),
                calcNumButtons("9"),
                calcOperatorButtons('-'),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                calcNumButtons("0"),
                calcOperatorButtons("="),
                calcOperatorButtons("x"),
                calcOperatorButtons('/'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
