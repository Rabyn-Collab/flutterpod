import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';



final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) => TodoProvider([]));



class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);



}