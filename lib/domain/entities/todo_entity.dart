class TodoEntity {
  String description;
  bool completed;

  TodoEntity({this.description, this.completed});

  TodoEntity.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['completed'] = this.completed;
    return data;
  }
}
