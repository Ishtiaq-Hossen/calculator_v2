class Calculator {
  double _result = 0;

  double get result => _result;

  void add(double num1, double num2) {
    _result = num1 + num2;
  }

  void subtract(double num1, double num2) {
    _result = num1 - num2;
  }

  void multiply(double num1, double num2) {
    _result = num1 * num2;
  }

  void divide(double num1, double num2) {
    if (num2 == 0) {
      throw ArgumentError("Cannot divide by zero");
    }
    _result = num1 / num2;
  }

  void clear() {
    _result = 0;
  }
}
