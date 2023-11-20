import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final ProviderScope fi
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}
