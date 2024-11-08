import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen> {
  final Calculator calculator = Calculator();
  String input = '';
  String displayResult = '0';
  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        calculator.clear();
        input = '';
        displayResult = '0';
      } else if (value == '=') {
        calculateResult();
        input='';
      } else {
        input += value;
        displayResult=input;
      }
    });
  }
  void calculateResult() {
    try {
      // Parsing and basic calculations
      final tokens = RegExp(r'(\d+|\+|\-|\*|/)').allMatches(input).map((match) => match.group(0)!).toList();
      print(tokens);
      if (tokens.length == 3) {
        final num1 = double.parse(tokens[0]);
        final num2 = double.parse(tokens[2]);
        final operator = tokens[1];
        // print("$num1 $num2 $operator");
        switch (operator) {
          case '+':
            calculator.add(num1, num2);
            break;
          case '-':
            calculator.subtract(num1, num2);
            break;
          case '*':
            calculator.multiply(num1, num2);
            break;
          case '/':
            calculator.divide(num1, num2);
            break;
        }
      }
      if(calculator.result.toString().length>=7){
        displayResult = calculator.result.toStringAsFixed(4);
      }
      else{
        displayResult = calculator.result.toString();
      }

    } catch (e) {
      displayResult = "Error";
    }
  }
  Widget calButton(String btntxt ,Color btnColor){
    return SizedBox(
      width: 85,
      height: 90,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              padding: EdgeInsets.all(15),
              shadowColor: Colors.black,
              // Adjust the padding to control button size
            ),

            onPressed: () => onButtonPressed(btntxt),
            child: Text(
              btntxt,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,),
        ),
        backgroundColor: Colors.deepPurple.shade300,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                displayResult,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
              
                    ),
              ),
            ),
            SizedBox(height: 70), // Add spacing to avoid overcrowding
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calButton('C',Colors.red.shade200),
                  calButton('0',Colors.white),
                  calButton('+',Colors.blue.shade50),
                  calButton('=',Colors.blue.shade50),
                ],
              ),

            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calButton('7',Colors.white),
                  calButton('8',Colors.white),
                  calButton('9',Colors.white),
                  calButton('/',Colors.blue.shade50),
                ],
              ),

            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calButton('4',Colors.white),
                  calButton('5',Colors.white),
                  calButton('6',Colors.white),
                  calButton('*',Colors.blue.shade50),
                ],
              ),

            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calButton('1',Colors.white),
                  calButton('2',Colors.white),
                  calButton('3',Colors.white),
                  calButton('-',Colors.blue.shade50),
                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Text("©copyright by Ishtiaq",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),)


          ],
        ),
      ),
    );
  }
}
