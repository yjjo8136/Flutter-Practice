import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  Future createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todos').doc();
    todo.id = docTodo.id;

    final json = todo.toJson();
    await docTodo.set(json);
  }
}

class Todo {
  String id;
  final String title;
  final String content;
  final DateTime uploadDate;

  Todo({
    this.id = '',
    required this.title,
    required this.content,
    required this.uploadDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'uploadDate': uploadDate,
      };
}
