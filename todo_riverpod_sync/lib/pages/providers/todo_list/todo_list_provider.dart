import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [
      const Todo(id: '1', desc: 'Clean the room'),
      const Todo(id: '2', desc: 'Wash the dishes'),
      const Todo(id: '3', desc: 'do homework'),
    ];
  }

  void addTodo(String desc) {
    state = [...state, Todo.add(desc: desc)];
    print(state);
  }

  void editTodo(String id, String desc) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(desc: desc) else todo
    ];
  }

  void toggleTodo(String id) {
    // 이런걸 collection for loop 이라고 한다.
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
    ];
  }

  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }
}
