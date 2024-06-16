import 'package:flutter/material.dart';
import 'package:sqflite_demo/screens/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ProductList(),
    );
  }
}