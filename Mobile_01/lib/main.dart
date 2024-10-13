import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: MyButton(),
      ),
    ),
  ));
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String texts = 'A simple Text';
  int currentIndex = 0;

  void _toggleText() {
    setState(() {
      if (currentIndex == 0)
        {
          texts = 'A simple Text';
          currentIndex = 1;
        }
      else
        {
          texts = 'Hello World!';
          currentIndex = 0;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texts,
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.green,
            letterSpacing: 5,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleText,
          child: Text('Click me'),
        ),
      ],
    );
  }
}
