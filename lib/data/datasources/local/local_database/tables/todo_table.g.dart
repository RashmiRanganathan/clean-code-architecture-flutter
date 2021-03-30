// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoTableAdapter extends TypeAdapter<TodoTable> {
  @override
  final int typeId = 0;

  @override
  TodoTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoTable(
      description: fields[1] as String,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
