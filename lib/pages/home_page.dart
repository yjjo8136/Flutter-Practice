import 'package:flutter/material.dart';
import 'package:todoapp/components/custom_todo.dart';
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
      body: ListView(
        children: [
          CustomTodo(),
          CustomTodo(),
          CustomTodo(),
        ],
      ),
    );
  }
}
