import 'package:flutter/material.dart';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/methods/crud_methods.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Column(
        children: [
          FutureBuilder<Todo?>(
              future: readTodo(id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot}');
                } else if (snapshot.hasData) {
                  final todo = snapshot.data!;

                  return todo == null
                      ? Center(child: Text('No Todo'))
                      : buildDetail(todo);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("수정"),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("삭제"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetail(Todo todo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              todo.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
              todo.content,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
              '${todo.uploadDate}',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
