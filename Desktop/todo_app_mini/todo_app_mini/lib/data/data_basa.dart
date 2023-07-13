import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

final _myBox = Hive.box('myBox');
List toDoList = [];

// run this method if this is a 1st time ever opening the app
void createInitalData(){
 toDoList = [
    ['Create your first task!', false]
  ];
}

// load data from databese
void loadData(){
  toDoList = _myBox.get('TODOLIST');


}


// update data to database
void updateData(){
  _myBox.put('TODOLIST', toDoList);
}
}