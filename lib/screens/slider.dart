import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:mitahari/screens/navigator.dart';
import 'package:numberpicker/numberpicker.dart';

class IntroScreenDemo extends StatefulWidget {
  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  String gender = "male";
  int age = 20;
  int height = 150;
  int weight = 40;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      bodyPadding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      pages: [
        PageViewModel(
            title:
                'Input your information to calculate your daily calorie goal',
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_status),
                ElevatedButton(
                    onPressed: () {
                      setState(() => _status = 'Going to the next page...');
                      // 3. Use the `currentState` member to access functions defined in `IntroductionScreenState`
                      Future.delayed(const Duration(seconds: 1),
                          () => _introKey.currentState?.next());
                    },
                    child: const Text('Start'))
              ],
            )),
        PageViewModel(
          title: 'Input your information to calculate your daily calorie goal',
          bodyWidget: Column(children: [
            const SizedBox(height: 50),
            const Text('Choose your gender',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF7F12DF))),
            OutlinedButton(
              child: const Text("Male"),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                gender = "Male";
              },
            ),
            OutlinedButton(
              child: const Text("Female"),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                gender = "Female";
              },
            ),
            SizedBox(height: 50),
            Text('Choose your age (in years)',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF7F12DF))),
            NumberPicker(
              value: age,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) => setState(() => age = value),
            ),
          ]),
          decoration: const PageDecoration(
            pageColor: Colors.green,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFF77406)),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w900, fontSize: 40.0),
          ),
        ),
        PageViewModel(
          title: 'Input your information to calculate your daily calorie goal',
          bodyWidget: Column(children: [
            SizedBox(height: 50),
            Text('Choose your height (in cms)',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF7F12DF))),
            NumberPicker(
              value: height,
              minValue: 100,
              maxValue: 300,
              onChanged: (value) => setState(() => height = value),
            ),
            SizedBox(height: 50),
            Text('Choose your weight (in kgs)',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF7F12DF))),
            NumberPicker(
              value: weight,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) => setState(() => weight = value),
            ),
          ]),
          decoration: const PageDecoration(
            pageColor: Colors.green,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFF77406)),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
      ],
      showNextButton: true,
      showDoneButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done"),
      onDone: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const navigator(),
            )
            // builder: (context) => temp(
            //       gender: gender,
            //       age: age,
            //       height: height,
            //       weight: weight,
            //     )),
            )
      },
    );
  }
}
