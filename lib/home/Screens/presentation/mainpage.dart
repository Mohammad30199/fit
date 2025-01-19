import 'package:fitlab_app/home/Screens/presentation/advanced.dart';
import 'package:fitlab_app/home/Screens/presentation/beginner.dart';
import 'package:fitlab_app/home/Screens/presentation/intermediate.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      
      ),
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "Your expertise level ?",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ) , 
              SizedBox(height: 20,) , 
              GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Beginner(),)),
                child:
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 100,
                  width: 300,
                  child: Center(child: Text("Beginner" , style: TextStyle(fontFamily: "Nunito" , fontSize: 30 , color: Colors.black , fontWeight: FontWeight.w500),)))
              ) , SizedBox(height: 40,) , 
              GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Intermediate(),)),
                child:
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 100,
                  width: 300,
                  child: Center(child: Text("Intermediate" , style: TextStyle(fontFamily: "Nunito" , fontSize: 30 , color: Colors.black , fontWeight: FontWeight.w500),)))
              ) ,
               SizedBox(height: 40,) , 
              GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Advanced(),)),
                child:
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 203, 203),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: 100,
                  width: 300,
                  child: Center(child: Text("Advanced" , style: TextStyle(fontFamily: "Nunito" , fontSize: 30 , color: Colors.black , fontWeight: FontWeight.w500),)))
              ) ,

            ],
          )
        ],
      ),
    );
  }
}
