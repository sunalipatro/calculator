import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  double _result = 0.0;
  String _currentOperator = '';

  void _handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == 'clear') {
        _input = '';
        _result = 0.0;
        _currentOperator = '';
      } else if (buttonText == '=') {
        if (_input.isNotEmpty) {
          _result = _performCalculation();
          _input = _result.toString();
        }
        _currentOperator = '';
      } else if (_isOperator(buttonText)) {
        if (_input.isNotEmpty && _currentOperator.isEmpty) {
          _currentOperator = buttonText;
          _result = double.parse(_input);
          _input = '';
        }
      } else {
        _input += buttonText;
      }
    });
  }

  bool _isOperator(String text) {
    return text == '+' || text == '-' || text == '*' || text == '/';
  }

  double _performCalculation() {
    final double inputValue = double.parse(_input);
    switch (_currentOperator) {
      case '+':
        return _result + inputValue;
      case '-':
        return _result - inputValue;
      case '*':
        return _result * inputValue;
      case '/':
        if (inputValue != 0) {
          return _result / inputValue;
        } else {
          // Handle division by zero
          return double.infinity;
        }
      default:
        return inputValue;
    }
  }

  Widget _buildCalculatorButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 90.0,
          height: 90.0,
          child: ElevatedButton(
            onPressed: () => _handleButtonPress(buttonText),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 30.0),
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
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Text(
                _input.isEmpty ? _result.toString() : _input,
                style: const TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          const Divider(height: 0.0),
          Row(
            children: [
              _buildCalculatorButton('7'),
              _buildCalculatorButton('8'),
              _buildCalculatorButton('9'),
              _buildCalculatorButton('/'),
            ],
          ),
          Row(
            children: [
              _buildCalculatorButton('4'),
              _buildCalculatorButton('5'),
              _buildCalculatorButton('6'),
              _buildCalculatorButton('*'),
            ],
          ),
          Row(
            children: [
              _buildCalculatorButton('1'),
              _buildCalculatorButton('2'),
              _buildCalculatorButton('3'),
              _buildCalculatorButton('-'),
            ],
          ),
          Row(
            children: [
              _buildCalculatorButton('.'),
              _buildCalculatorButton('0'),
              _buildCalculatorButton('='),
              _buildCalculatorButton('+'),
            ],
          ),
          Row(
            children: [
              _buildCalculatorButton('clear'),
            ],
          ),
        ],
      ),
    );
  }
}
