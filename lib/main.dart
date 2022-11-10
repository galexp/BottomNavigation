import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redo_todo/provider/favourite_provider.dart';
import 'package:redo_todo/screens/home_screen.dart';

void main() {
  runApp(const RedoTodo());
}

class RedoTodo extends StatelessWidget {
  const RedoTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MaterialApp(
      home: HomeScreen(),
    ),
      );
  }
}