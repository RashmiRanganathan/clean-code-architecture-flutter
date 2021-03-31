import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    bool completed,
    String id, 
    String description,
    String owner,
    DateTime createdAt,
    DateTime updatedAt,
  }
  ) : super(
    completed: completed , id: id , description: description , owner: owner , createdAt: createdAt, updatedAt: updatedAt
  );
  
  static List<TodoModel>fromListJson(Map<String, dynamic> json) {
  final List<Object> dataList=json['data'];
  return dataList.map((dataitem) => TodoModel.fromJson(dataitem)).toList();
 }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(completed : json['completed'],
   id : json['id'],
   description : json['description'],
   owner : json['owner'],
   createdAt : json['createdAT'],
   updatedAt : json['updateAT']);
 }

}
