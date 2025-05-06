import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String screenText;
  final String imagePath;
  const OnboardingScreen(
      {super.key, required this.screenText, required this.imagePath});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            padding: EdgeInsets.all(5),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagePath), fit: BoxFit.cover),
            ),
          ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment(0, 0.6),
                child: Text(
                  textAlign: TextAlign.start,
                  screenText,
                  style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
              // Text(
              //   screenText,
              //   style: TextStyle(fontSize: 30, color: Colors.white),
              // ),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
