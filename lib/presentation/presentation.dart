import 'package:flutter/material.dart';
import 'package:sqflitepractice/presentation/widgets/TextFields.dart';

class Presentation extends StatelessWidget {
  const Presentation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(   
        appBar: (
          AppBar(
            title: Text("Form"),
          )
        ),
        body:TextFields(),
      ),
    );
  }
}