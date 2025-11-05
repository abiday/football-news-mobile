import 'package:flutter/material.dart';
// DIUBAH: Path import disesuaikan dengan lokasi file baru
import 'package:football_news/screens/menu.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
 .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: MyHomePage(),
    );
  }
}