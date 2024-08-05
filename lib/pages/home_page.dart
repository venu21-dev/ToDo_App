import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box..dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  //text controller
  final _controller = TextEditingController();

  //List of to do Task

  List toDoList = [
  //["Create a ToDo App", false],
  //["Go to the Gym", false],
  ];
  
  //ckeckbox was tapped, if tapped its turns checked

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
 
    });
  }

  //save new Task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

//create a new task, it should appear a diolog Box where the User can input his Task
void creatNewTask() {
  showDialog(context: context, builder: (context) {
    return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
   );
  },
 );
}

//delte task
void delteTask(int index){
  setState(() {
    toDoList.removeAt(index);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Task List"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => delteTask(index),
          );
        },
      )
    );
  }
}