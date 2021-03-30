class TodoEntity {
  String id;
  String owner;
  bool completed;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  TodoEntity({this.id, this.owner, this.completed, this.description, this.createdAt, this.updatedAt});
}