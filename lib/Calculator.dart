class CalculatorBrain {
  String _display = "";
  int answer;
  String _operator;

  String getDisplay() {
    return _display;
  }

  void updateDisplay(String num) {
    _display += num;
  }

  void operationUpdate(String oper) {
    if (oper == "=") {
      calculate();
    } else if (oper == "C") {
      if (_display.length > 0) {
        String temp = "";
        for (int i = 0; i < _display.length - 1; i++) {
          temp += _display[i];
        }
        _display = temp;
      } else {
        _display = "";
      }
    } else {
      _operator = oper;
      answer = int.parse(_display);
      _display = "";
    }
  }

  void calculate() {
    if (_operator == "+") {
      answer += int.parse(_display);
      _display = answer.toString();
    } else if (_operator == "-") {
      answer -= int.parse(_display);
      _display = answer.toString();
    } else if (_operator == "x") {
      answer *= int.parse(_display);
      _display = answer.toString();
    } else if (_operator == "/") {
      double x;
      x = answer / double.parse(_display);
      answer = x.round();
      _display = answer.toString();
    }
    _operator = "";
  }
}
