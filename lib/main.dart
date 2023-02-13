import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductList(),
    );
  }
}
