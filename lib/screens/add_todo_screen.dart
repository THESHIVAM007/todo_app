import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';
// import 'flutterriv';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final textController = TextEditingController();

  void onSubmit() {
    var todo = textController.text;
    ref.read(todoListProvider.notifier).add(todo);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'add Todo',
              ),
              controller: textController,
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
