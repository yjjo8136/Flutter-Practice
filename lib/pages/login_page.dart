import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loginapp/components/Logo.dart';
import 'package:loginapp/components/custom_form.dart';
import 'package:loginapp/components/custom_text_form_field.dart';
import 'package:loginapp/size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("Login"),
            SizedBox(height: large_gap),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
