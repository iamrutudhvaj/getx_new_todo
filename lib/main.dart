import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_todo/screens/home_screen.dart';
// import 'package:getx_new_todo/screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
