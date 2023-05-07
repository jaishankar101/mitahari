import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 5),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String dateStr =
        "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Text(
            "MITAHARI",
            style: TextStyle(color: Color(0xFFFFC300)),
          ),
          const SizedBox(width: 60),
          Text(
            dateStr,
            style: const TextStyle(fontSize: 10.0, color: Color(0xFFFFC300)),
          ),
        ]),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.date_range_rounded,
              color: Color(0xFFFFC300),
            ),
            tooltip: 'Show Date',
            onPressed: () {
              _selectDate(context);
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        backgroundColor: Color(0xFF581845),
        // centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("This is Home Page"),
          ],
        ),
      ),
    );
  }
}
