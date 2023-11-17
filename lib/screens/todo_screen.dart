import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_todo_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _todosList = [
    'todo 1',
    'todo 2',
    'todo 3',
    'todo 4',
    'todo 5',
  ];
  void onClickAdd() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget content = const Center(
    //   child: Text('no todo added'),
    // );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Todo'),
          actions: [
            IconButton(onPressed: onClickAdd, icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _todosList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                height: 50,
                color: Colors.amber,
                child: Center(child: Text(_todosList[index])),
              );
            }));
  }
}
