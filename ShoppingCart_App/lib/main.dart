import 'package:flutter/material.dart';
import 'package:shoppingcartapp/components/shoppingcart_detail.dart';
import 'package:shoppingcartapp/components/shoppingcart_header.dart';
import 'package:shoppingcartapp/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: ListView(
        children: [
          ShoppingCartHeader(),
          ShoppingCartDetail(),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() => AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print("클릭됨");
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("클릭됨");
            },
            icon: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 16.0,
          ),
        ],
      );
}
