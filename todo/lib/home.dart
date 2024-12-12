// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/logBox.dart';
import 'package:todo/util/todolist.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _hometState();
}

// ignore: camel_case_types
class _hometState extends State<home> {
  final _controller = TextEditingController();

  final _mybox = Hive.box('mybox');

  tododatabase db = tododatabase();

  void initState() {
    if (_mybox.get("Todolist") == null) {
      db.createintialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  void deletetext(int index) {
    setState(() {
      db.Todo.removeAt(index);
    });
  }

  void checkbox(bool? value, int index) {
    setState(() {
      db.Todo[index][1] = !db.Todo[index][1];
    });
    db.updatedata();
  }

  void seveNewTask() {
    setState(() {
      db.Todo.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void createlog() {
    showDialog(
      context: context,
      builder: (context) {
        return Logbox(
          controller: _controller,
          onchangeseved: seveNewTask,
          onchangecancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'To Do List',
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createlog,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: db.Todo.length,
        itemBuilder: (context, index) {
          return Todolist(
            taskname: db.Todo[index][0],
            taskCompleted: db.Todo[index][1],
            onChanged: (value) => checkbox(value, index),
            // ignore: avoid_types_as_parameter_names
            deleteFunction: (BuildContext) => deletetext(index),
          );
        },
      ),
    );
  }
}
