import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/classes/todo.dart';

Future createTodo(Todo todo) async {
  final docTodo = FirebaseFirestore.instance.collection('todos').doc();
  todo.id = docTodo.id;

  final json = todo.toJson();
  await docTodo.set(json);
}

Stream<List<Todo>> readTodos() =>
    FirebaseFirestore.instance.collection('todos').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());

Future<Todo?> readTodo(String id) async {
  final docTodo = FirebaseFirestore.instance.collection('todos').doc(id);
  final snapshot = await docTodo.get();

  if (snapshot.exists) {
    return Todo.fromJson(snapshot.data()!);
  }
}
