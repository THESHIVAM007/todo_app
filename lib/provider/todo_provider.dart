import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier() : super([]);

  void add(String todo) {
    state = [...state, todo];
    _saveTodoList(); // Save todo list after adding a new todo
  }

  void remove(String todo) {
    state = List.from(state)..remove(todo);
    _saveTodoList(); // Save todo list after removing a todo
  }

  void setTodoList(List<String> newList) {
    state = newList;
    _saveTodoList(); // Save todo list after setting a new list
  }

  Future<void> _saveTodoList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('todoList', state);
    } catch (e) {
      print('Error saving todo list: $e');
    }
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<String>>(
  (ref) => TodoListNotifier(),
);
