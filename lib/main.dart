import 'package:flutter/material.dart';
// Import baru
import 'package:football_news/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_news/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ini adalah widget Provider yang kita tambahkan
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent[400]),
        ),
        // home: MyHomePage(), // <-- Baris ini akan kita ubah nanti
        home: const LoginPage(), // <-- Untuk sementara biarkan seperti ini
      ),
    );
  }
}