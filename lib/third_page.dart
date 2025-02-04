import 'package:flutter/material.dart';
import 'dart:math'; // For random function
import 'globals.dart'; // Import global variables

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late List<bool> isRedList; // Track red containers
  late int redCount; // Track how many containers are red

  @override
  void initState() {
    super.initState();
    // Initialize the new list for tracking red containers
    isRedList = List.generate(numberOfContainers, (index) => false);

    // Pick a random red container at the start
    int firstRedIndex = Random().nextInt(numberOfContainers);
    isRedList[firstRedIndex] = true;
    redCount = 1; // Start with 1 red container
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
      redCount++; // Increase red counter
    });

    // Check if all containers have turned red
    if (redCount == numberOfContainers) {
      print("All containers are red!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Page")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Tap the Red Containers",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
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
                        color: isRedList[index] ? Colors.red : Colors.blue,
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
