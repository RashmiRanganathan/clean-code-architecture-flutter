import '../../data/models/todo_model.dart';
class TodoEntity {
  String id;
  bool completed;
  String description;
  TodoEntity({
    this.id,
    this.completed,
    this.description,
  });

  TodoModel todoModel(){
    return TodoModel(id: this.id);
  }
}
