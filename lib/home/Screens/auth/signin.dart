import 'package:fitlab_app/home/Screens/Firbase/FirebaseServices.dart';
import 'package:fitlab_app/home/Screens/auth/signup.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController EmailController = TextEditingController();
    final TextEditingController PasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Welcome to FitLab",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Icon(
                Icons.hourglass_top_outlined,
                color: Colors.green,
                size: 30,
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: TextField(
              controller: EmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Email",
                label: const Text("Email"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
            child: TextField(
              controller: PasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Password",
                label: const Text("Password"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Signup();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot My Password",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          MaterialButton(
            onPressed: () {
              Firebaseservices.login(EmailController.text.trim(),
                  PasswordController.text.trim(), context);
              Firebaseservices.getUserData(EmailController.text.trim());
            },
            color: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have An Account ?"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Signup();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              )
            ],
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
                    "Login with Gmail",
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
                    "Login with Facebook",
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
