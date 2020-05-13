import 'package:flutter/material.dart';
import 'package:dept_emp_data/screens/dep_emp_card_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: dept_emp_list(),
    );
  }
}

