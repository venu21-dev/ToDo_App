import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller, 
    required this.onSave, 
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //User input, here the User can write his task
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
                hintText: "Add a new Task . . .",
              ),
            ),
          
            //buttons > Save & cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              // save buttons
              MyButton(text: "Save", onPressed: onSave),
              
              const SizedBox(width: 10),

              // cancel buttons
              MyButton(text: "Cancel", onPressed: onCancel),

            ],
            ),
            ],
          ),
        ),
    );
  }
}