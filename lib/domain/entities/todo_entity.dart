class TodoEntity {
  final bool completed;
  final String id, description,owner;
  final DateTime createdAt,updatedAt;

  TodoEntity({this.completed, this.id, this.description, this.owner, this.createdAt, this.updatedAt});
}
