import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Abstract class takes 2 types.
/// First datatype is used for storing value. [The key is stricted to be String]
/// Second datatype is the model from which the table is extended from. This is
/// used for a overriden function that takes inout as list of model datatype and
/// converts to list of table datatype to insert into database
///
/// This class contains basic functions such as
/// get, getAll, insertOrUpdateAll, delete, deleteAll
///
/// Initiate the class with box name.
///
/// Every extended class should register the adapters in the constructor.
///
/// Example:
/// ```dart
/// ContactsLocalDataSource() : super(boxName: 'contacts') {
/// DatabaseUtil.registerAdapter<ContactTable>(ContactTableAdapter());
/// DatabaseUtil.registerAdapter<AccountContactTable>(
///     AccountContactTableAdapter());
/// }
/// ```
/// Adapter are the hive table adapter which is used for storing data
/// It is generated code by hive.
/// ContactTable will generate its adapter and by default the name will be
/// ContactTableAdapter
abstract class BaseLocalDataSource<TableType, ModelType> {
  String _boxName;
  Future<Box<TableType>> boxInstance;

  BaseLocalDataSource({
    @required String boxName,
  }) {
    _boxName = boxName;
  }

  void _init() {
    boxInstance = Hive.openBox(_boxName);
  }

  Future<Box<TableType>> get getBoxInstance async => _openBox();

  Future<List<ModelType>> getFormattedData();

  Future<Box<TableType>> _openBox() async {
    Box<TableType> box = await boxInstance;
    if (box == null || !box.isOpen) {
      _init();
      return boxInstance;
    }
    return box;
  }

  Future<TableType> get(String key) async {
    final Box<TableType> box = await _openBox();
    return box.get(key);
  }

  Future<List<TableType>> getAll() async {
    final Box<TableType> box = await _openBox();
    return box.toMap().values.toList();
  }

  Future<void> put(String key, TableType value) async {
    final Box<TableType> box = await _openBox();
    await box.put(key, value);
  }

  Future<void> putAll(Map<String, TableType> items) async {
    final Box<TableType> box = await _openBox();
    await box.putAll(items);
  }

  Future<void> delete(String key) async {
    final Box<TableType> box = await _openBox();
    await box.delete(key);
  }

  Future<void> deleteAll() async {
    final Box<TableType> box = await _openBox();
    final List<String> boxKeys = await keys;
    await box.deleteAll(boxKeys);
  }

  Future<List<String>> get keys async {
    final Box<TableType> box = await _openBox();
    final List<String> result = box.keys.map((k) => k.toString()).toList();
    return result;
  }
}
