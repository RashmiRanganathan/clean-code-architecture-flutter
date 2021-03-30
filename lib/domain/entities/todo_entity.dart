import 'package:flutter/material.dart';

class TodoEntity {
  final String description;
  final bool completed;

  TodoEntity({@required this.description, this.completed = false});

  String getDescription(){
    return description;
  }
}

