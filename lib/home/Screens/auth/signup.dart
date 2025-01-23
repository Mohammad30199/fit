import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlab_app/home/Screens/Firbase/FirebaseServices.dart';
import 'package:fitlab_app/home/Screens/presentation/homescreen.dart';
import 'package:fitlab_app/home/Screens/presentation/mainpage.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        title: const Text("FitLab"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FitLab",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Nunito",
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Image.asset(
                "assets/images/zxcz.png",
                height: 100,
                width: 100,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                  hintText: "Enter your username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your password again",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.grey)),
              onPressed: () async {
                await Firebaseservices.signup(emailController.text.trim(),
                    passwordController.text.trim(), context);
                try {
                  await Firebaseservices.signup(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    context,
                  );

                  await Firebaseservices.saveUserData(
                      userController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context);
                  print(FirebaseAuth.instance.currentUser);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error: ${e.toString()}")),
                  );
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Mainpage(),
                  ),
                );
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 142, 239, 145))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign up with Gmail",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    "assets/images/gmail.png",
                    height: 40,
                    width: 40,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 142, 239, 145))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Signup with Facebook",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    "assets/images/facebookimg.png",
                    height: 40,
                    width: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
