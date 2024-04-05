import 'package:flutter/material.dart';


 void main() {
  runApp(const MyWidget());
} 

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
 Widget build(BuildContext context) {
  return DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Tabbed App'),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
        ],
      ),
    ),
    body: const TabBarView(
      children: [
        // Content for Tab 1,
        // Content for Tab 2,
        // Content for Tab 3,
      ],
    ),
  ),
);


  }
}

