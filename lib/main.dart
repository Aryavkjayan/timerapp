import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:timerapp/first.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 128, 128, 4),
                Color.fromARGB(255, 115, 130, 4)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
            ),
          child: const StartScreen(
            
          ),),
      ),
    ),
  );
}
