import 'package:read/models/book_model.dart';

class TodoResponse {
  final List<Todo> todos;
  final String apiMore;
  TodoResponse(this.todos, this.apiMore);
}
