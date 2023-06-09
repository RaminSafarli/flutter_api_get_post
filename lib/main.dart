import 'package:flutter/material.dart';
import 'package:flutter_api/pages/Home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
      ),
      home: const HomePage(),
    );
  }
}
