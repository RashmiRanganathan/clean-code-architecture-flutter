import 'package:hive/hive.dart';

import 'sample_table.dart';

class SampleTableAdapter extends TypeAdapter<SampleTable> {
  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, SampleTable obj) {}

  @override
  SampleTable read(BinaryReader reader) {
    return null;
  }
}
