import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String name;
  VoidCallback onTap;
    MyButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap, 
      height: 35, 
      child: Text(name, style: TextStyle(color: Colors.white),),
      color: Colors.blueGrey,);
  }
}