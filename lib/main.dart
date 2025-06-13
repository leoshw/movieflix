import 'package:flutter/material.dart';
import 'package:movieflix/screens/homescreen.dart';

void main() {
  runApp(const Mymovie());
}

class Mymovie extends StatelessWidget {
  const Mymovie({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieflix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: Colors.white,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
