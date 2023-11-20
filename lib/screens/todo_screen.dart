import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/add_todo_screen.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({super.key});

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  List<String> _todosList = [];
  void onClickAdd() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _todosList = ref.watch(todoListProvider);

    Widget content = const Center(
      child: Text('no todo added'),
    );

    if (_todosList.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _todosList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: const Text('Delete'),
            ),
            onDismissed: (direction) {
              ref.read(todoListProvider.notifier).remove(_todosList[index]);
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
