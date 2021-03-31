class TodoEntity {
  String id;
  String description;
  bool completed;

  TodoEntity({this.description, this.completed, this.id});

  TodoEntity.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    completed = json['completed'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['id'] = this.id;
    return data;
  }
}
