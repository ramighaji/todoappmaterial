import 'package:flutter/material.dart';
import '../widget/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback addTask;
  VoidCallback close;

  DialogBox({super.key, 
  required this.controller, 
  required this.addTask, 
  required this.close});
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[200],
      content: Container(        
      child: Column(
        children: [
          Text('Create new Task', ),
          SizedBox(height: 10,),
          TextField(                      
            controller: controller,            
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Add new task'),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(name: 'Add Task', onTap: addTask),
              MyButton(name: 'Close', onTap: close),
            ],
          )
        ],
      ),
      height: 160,
      ),
    );
  }
}