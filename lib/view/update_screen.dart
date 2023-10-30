import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';

class UpdateTaskScreen extends StatefulWidget {
   final TaskModel taskModel;
  const UpdateTaskScreen({super.key, required this.taskModel});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}