import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class tododatabase {
  // ignore: non_constant_identifier_names
  List Todo = [];

  // ignore: unused_field
  final _mybox = Hive.box('mybox');

  void createintialdata() {
    Todo = [
      ["Coplete the Flutter development", false],
      ["Complete the react js", false],
    ];
  }

  void loaddata() {
    Todo = _mybox.get("Todolist");
  }

  void updatedata() {
    _mybox.put("Todolist", Todo);
  }
}
