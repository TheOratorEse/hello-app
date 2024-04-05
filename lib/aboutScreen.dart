import 'package:flutter/material.dart';

void main() {
  
  runApp( const AboutScreen());
  
}


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('My About Screen');
  }
}