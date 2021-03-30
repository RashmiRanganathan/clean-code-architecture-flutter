import 'package:flutter/material.dart';

class TodoEntity {
  final String description;

  TodoEntity({@required this.description});

  String getDescription(){
    return description;
  }
}

