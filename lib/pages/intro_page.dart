import 'package:flutter/material.dart';
import 'package:shopapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Logo
            Padding(
              padding: const EdgeInsets.only(top:160.0,left:80,right:80,bottom: 80),
              child: Image.asset("assets/images/shop.png"),
            ),
          //Logo
          //Slogan
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              textAlign: TextAlign.center,
              "Quality shopping destination: Everyone's Market!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38
              ),
            ),
          ),
          //Slogan
          //Subtitle
          const Text(
            "Fresh items everyday"
          ),
          //Subtitle
          const Spacer(),
          //get started button
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12)
              ),
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
            ),
          ),
          //get started button
          const Spacer()
        ],
      ),
    );
  }
}