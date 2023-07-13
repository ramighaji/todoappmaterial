import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskTitle;
  final bool checkedTask;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoTile({
      super.key,
      required this.taskTitle,
      required this.checkedTask,
      required this.onChanged,
      required this.deleteTask,
      }); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(

          motion: StretchMotion(), 
          children:[ SlidableAction(
          onPressed: deleteTask, 
          icon: Icons.delete, 
          backgroundColor: Colors.red,),
                    ],),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color:Colors.blueGrey),
          child: Row(
          children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(taskTitle, style: TextStyle(
                  decoration: checkedTask? TextDecoration.lineThrough:TextDecoration.none, 
                  color: Colors.white,
                  fontSize: 17,),),
              ),
              Spacer(),
              Checkbox(
                checkColor: Colors.white,
                value: checkedTask, 
                onChanged: onChanged
                ),
            ],
          ),
        ),
      ),
    );
  }
}


void deleteTask(){

}