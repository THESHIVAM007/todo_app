import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier() : super([]);

  void add(String todo) {
    state = [...state, todo];
  }

  void remove(String todo) {
    state = List.from(state)..remove(todo);
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<String>>((ref) {
  return TodoListNotifier();
});
