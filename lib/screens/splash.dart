//not required now see later
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 6),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => temp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
              constraints: BoxConstraints.expand(height: 300.0),
              decoration: BoxDecoration(color: Colors.grey),
              child: Image.asset(
                "assets/icons/logo.jpg",
                fit: BoxFit.cover,
              )),
          Marquee(
            child: Text(
              "Healthy Choices, Simplified",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
              // pauseAfterRound: Duration(seconds: 1)
            ),
            textDirection: TextDirection.rtl,
            animationDuration: Duration(seconds: 1),
            backDuration: Duration(milliseconds: 5000),
            pauseDuration: Duration(milliseconds: 2500),
            directionMarguee: DirectionMarguee.oneDirection,
          ),
          Container(
            child: Text('MITIHARI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        ])));
  }
}
