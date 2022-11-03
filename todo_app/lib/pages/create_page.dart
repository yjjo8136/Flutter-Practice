import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/methods/crud_methods.dart';

class CreatePage extends StatelessWidget {
  final controllerTitle = TextEditingController();
  final controllerContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
      ),
      body: ListView(
        children: [
          SizedBox(height: 24),
          TextField(
            controller: controllerTitle,
            decoration: InputDecoration(hintText: "Title"),
          ),
          SizedBox(height: 24),
          TextField(
            controller: controllerContent,
            decoration: InputDecoration(hintText: "Content"),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final todo = Todo(
                title: controllerTitle.text,
                content: controllerContent.text,
                uploadDate: DateTime.now(),
              );

              createTodo(todo);

              Navigator.pop(context);
            },
            child: Text("Create"),
          )
        ],
      ),
    );
  }
}
