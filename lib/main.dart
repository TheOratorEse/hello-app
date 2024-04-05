import 'package:flutter/material.dart';
import 'secondScreen.dart';
import 'aboutScreen.dart';
import 'dart:convert';
import 'about.dart';
import 'package:http/http.dart' as http;

/* void main() {
  runApp(const MyApp());
} */

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/second': (context) => const SecondScreen(),
        '/about': (context) => const AboutScreen(),
        'abb': (context) =>  const MyWidget()
      },
    ),
  );
}

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    Iterable jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text(
              'My Homepage!',
              style: TextStyle(
                fontSize: 24,
                // letterSpacing: 5,
                wordSpacing: 10,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )),
        body:     Form(
  child: Column(
    children: [
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Username',
        ),
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'abb');
          // Handle form submission
        },
        child: const Text('Submit'),
      ),
    ],
  ),
),


        /* GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Item $index'),
      ),
    );
  },
), */

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text('Button'),
        ),
      ),
    );
  }
}
