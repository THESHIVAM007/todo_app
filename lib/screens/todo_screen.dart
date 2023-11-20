import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_todo_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _todosList = [];
  void onClickAdd() async {
    var newTodo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddTodoScreen(),
      ),
    );
    setState(() {
      _todosList.add(newTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('no todo added'),
    );

    if (_todosList.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _todosList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(color: Colors.red,child: const Text('Delete'),),
            onDismissed: (direction) {
              
              setState(() {
                _todosList.removeAt(index);
              });
            },
            key: ValueKey(index),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              height: 50,
              color: Colors.amber,
              child: Center(child: Text(_todosList[index])),
            ),
          );
        },
      );
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Todo'),
          actions: [
            IconButton(onPressed: onClickAdd, icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
