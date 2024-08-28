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
  // Metinler listesi ve mevcut metnin indeksi.
  List<String> texts = ['A simple text', 'Hello World'];
  int currentIndex = 0;

  void _toggleText() {
    setState(() {
      // currentIndex değişkenini her tıklamada değiştiriyoruz.
      currentIndex = (currentIndex + 1) % texts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texts[currentIndex],
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.green,
            letterSpacing: 5,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _toggleText, // Butona tıklanınca metin değiştirilecek.
          child: Text('Click me'),
        ),
      ],
    );
  }
}
