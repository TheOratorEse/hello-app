import 'package:flutter/material.dart';


void main() {
  runApp(const SecondScreen());
}






class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                'My Second Screen!',
                style: TextStyle(
                  fontSize: 24,
                  backgroundColor: Colors.red,
                  // letterSpacing: 5,
                  wordSpacing: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
      body: ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: const Text('Go Back'),
)

,
      
      
      ),
      );

  }
}