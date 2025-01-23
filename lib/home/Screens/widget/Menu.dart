import 'package:fitlab_app/home/Screens/presentation/bmi.dart';
import 'package:fitlab_app/home/Screens/presentation/homescreen.dart';
import 'package:fitlab_app/home/Screens/presentation/mainpage.dart';
import 'package:flutter/material.dart';

class IconWithMenu extends StatelessWidget {
  const IconWithMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (value) {
        if (value == 'Workouts') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Mainpage()),
          );
        } else if (value == 'BMI Calculator') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BMICalculator()));
        } else if (value == 'Logout') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value)),
          );
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'HomeScreen',
            child: Text('Home Screen'),
          ),
          const PopupMenuItem(
            value: 'Profile',
            child: Text('Profile'),
          ),
          const PopupMenuItem(
            value: 'Workouts',
            child: Text('Workouts'),
          ),
          const PopupMenuItem(
            value: 'BMI Calculator',
            child: Text('BMI Calculator'),
          ),
          const PopupMenuItem(
            value: 'Edit Profile',
            child: Text('Edit Profile'),
          ),
          const PopupMenuItem(
            value: 'Logout',
            child: Text('Logout'),
          ),
        ];
      },
    );
  }
}
