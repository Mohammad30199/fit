import 'package:fitlab_app/home/Screens/auth/signin.dart';
import 'package:fitlab_app/home/Screens/auth/signup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FitLab",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 50),
              ),
              Image.asset(
                "assets/images/zxcz.png",
                height: 100,
                width: 100,
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Signin(),
              ));
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Signup(),
                ),
              );
            },
            child: Text("Sign up",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
