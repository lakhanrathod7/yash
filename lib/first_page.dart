import 'package:flutter/material.dart';
import 'package:yash/seconde_page.dart';

import 'globals.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = numberOfContainers.toString(); // Load saved number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                numberOfContainers = int.tryParse(value) ?? 0;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText:"Enter any digits",
                  hintText: "Enter any digits",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
