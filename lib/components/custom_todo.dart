import 'package:flutter/material.dart';
import 'package:todoapp/pages/detail_page.dart';

class CustomTodo extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final DateTime uploadDate;

  const CustomTodo(
      {required this.id,
      required this.title,
      required this.content,
      required this.uploadDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(id: id)),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(content),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '$uploadDate',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
