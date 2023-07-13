import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/data_basa.dart';
import '../widget/to_do_tile.dart';
import 'dialog_box.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

    @override
  void initState() {
    if(_myBox.get("DOTOLIST")==null){
      db.createInitalData();
    }else{
      db.loadData();
    }
    
    super.initState();
    
  }

  void checkedBox (bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateData();
  }

  
  // add new task from pop up to directory
  void addNewTask (){
    setState(() {
      db.toDoList.add([_controller.text, false]); 
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // method create new task 
 void createNewTask (){
  showDialog(context: context, 
  builder: (context){
    return DialogBox(
      controller: _controller,
      addTask: addNewTask,
      close: () => Navigator.of(context).pop(),
    );
  });
 }

  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('To Do Application', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,        
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {  
          return ToDoTile(
            taskTitle: db.toDoList[index][0], 
            checkedTask: db.toDoList[index][1], 
            onChanged: (value) => checkedBox(value, index),
            deleteTask: (context) => deleteTask(index),

            );      
        },        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createNewTask();
        }, 
        child: Icon(Icons.add),),
      
      );

  }
}