import'package:flutter/material.dart';
import 'package:yash/first_page.dart';

void main(){
  runApp(MyApp());
}

//hi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
