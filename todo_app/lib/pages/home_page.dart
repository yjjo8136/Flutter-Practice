import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/components/custom_todo.dart';
import 'package:todoapp/methods/crud_methods.dart';
import 'package:todoapp/pages/create_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePage()),
              );
            },
            icon: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
          stream: readTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot}');
            } else if (snapshot.hasData) {
              final todos = snapshot.data!;

              return ListView(
                children: todos.map(buildTodo).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildTodo(Todo todo) => CustomTodo(
        id: todo.id,
        title: todo.title,
        content: todo.content,
        uploadDate: todo.uploadDate,
      );
}
