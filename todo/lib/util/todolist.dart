import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  final Function(BuildContext)? deleteFunction;
  final Function(bool?)? onChanged;

  const Todolist({
    Key? key,
    required this.taskname,
    required this.taskCompleted,
    required this.deleteFunction,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              label: 'Delete',
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Expanded(
                child: Text(
                  taskname,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
