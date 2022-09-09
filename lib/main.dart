import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AAAAadUn6Ng:APA91bHaYDfNlNYnZRVpvNSwJpKLN4B1xexrlvZ9FpqBWMIznyYxHR3DzPrv789K_l0e_Z9Xik3EUvgMSqQnl_tdjIlYafVLvQe5D4FSvehIQ3TxO5jsi3TgekBikqwBBgLcoB9SaUZM", // Your apiKey
      appId: "1:454547728600:android:1fbf21bbd08f1c615dcfad", // Your appId
      messagingSenderId: "454547728600", // Your messagingSenderId
      projectId: "todo-app-b698f", // Your projectId
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
