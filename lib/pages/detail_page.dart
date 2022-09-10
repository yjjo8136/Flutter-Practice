import 'package:flutter/material.dart';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/methods/crud_methods.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: StreamBuilder<List<Todo>>(
          stream: readTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot}');
            } else if (snapshot.hasData) {
              final todos = snapshot.data!;

              return ListView(
                children: todos.map(buildDetail).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildDetail(Todo todo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            todo.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            todo.content,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${todo.uploadDate}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
