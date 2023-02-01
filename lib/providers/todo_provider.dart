import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';



final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) => TodoProvider([]));



class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);

  void add (Todo todo){
  state = [...state, todo];
  }

  void remove(Todo todo){
    state.remove(todo);
    state = [...state];
  }

  void update(Todo updatedTodo, int index){
    state[index] = updatedTodo;
    state = [...state];
    // state = [
    //   for(final todo in state)
    //     if(updatedTodo == todo) updatedTodo else todo
    // ];

  }



}