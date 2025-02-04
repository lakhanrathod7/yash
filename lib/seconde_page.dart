
import 'package:flutter/material.dart';
import 'dart:math';
import 'globals.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late int redContainerIndex; // First random red container
  int redCount = 1; // Counter to track red containers (starts at 1)

  @override
  void initState() {
    super.initState();
    if (numberOfContainers > 0) {
      redContainerIndex = Random().nextInt(numberOfContainers); // Pick a random red container
      isRedList = List.generate(numberOfContainers, (index) => false);
      isRedList[redContainerIndex] = true; // Set the first red container
    }
  }

  void handleTap(int index) {
    if (!isRedList[index]) return; // Only allow tapping red containers

    setState(() {
      // Find a new random container to turn red
      int newRedIndex;
      do {
        newRedIndex = Random().nextInt(numberOfContainers);
      } while (isRedList[newRedIndex]); // Ensure it's a new red container

      isRedList[newRedIndex] = true;
      redCount++; // Increase counter
    });

    // Check if the last container has turned red
    if (redCount == numberOfContainers) {
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThirdPage()), // Navigate to Third Page
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: numberOfContainers,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => handleTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isRedList[index] ? Colors.red : Colors.blue, // Red or blue
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
