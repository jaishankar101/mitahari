import 'package:flutter/material.dart';

// ignore: camel_case_types
class recipes extends StatefulWidget {
  const recipes({super.key});

  @override
  State<recipes> createState() => _recipesState();
}

class _recipesState extends State<recipes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("This is Recipe Page")),
    );
  }
}
