import 'package:fitlab_app/home/Screens/presentation/bmi.dart';
import 'package:flutter/material.dart';

class Beginner extends StatelessWidget {
  const Beginner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body:BMICalculator() ,
    );
  }
}