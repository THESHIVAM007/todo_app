import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
   const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final textController = TextEditingController();

  void onSubmit(){
var todo = textController.text;
Navigator.of(context).pop(todo);

  }

// DisposableBuildContext
@override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
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
              onPressed:onSubmit,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
