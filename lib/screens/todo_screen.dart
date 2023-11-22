import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends ConsumerStatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends ConsumerState<TodoScreen> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadTodoList(); // Load todoList when the widget is initialized
  }

  Future<void> _loadTodoList() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      final List<String>? savedList = _prefs.getStringList('todoList');
      if (savedList != null) {
        ref.read(todoListProvider.notifier).setTodoList(savedList);
      }
    } catch (e) {
      print('Error loading todo list: $e');
    }
  }

  Future<void> _saveTodoList(List<String> todosList) async {
    await _prefs.setStringList('todoList', todosList);
  }

  void onClickAdd() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('no todo added'),
    );

    final todosList = ref.watch(todoListProvider);

    if (todosList.isNotEmpty) {
      content = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todosList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: const Text('Delete'),
            ),
            onDismissed: (direction) {
              var removedTodo = todosList[index];
              ref.read(todoListProvider.notifier).remove(removedTodo);
              _saveTodoList(todosList);
            },
            key: ValueKey(index),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              height: 50,
              color: Colors.amber,
              child: Center(child: Text(todosList[index])),
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
      body: content,
    );
  }
}
