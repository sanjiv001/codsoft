import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/model/task.dart';

class UpdateTaskScreen extends StatefulWidget {
  final TaskModel taskModel;

  const UpdateTaskScreen({Key? key, required this.taskModel}) : super(key: key);

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  var taskController = TextEditingController();
  var taskdetailcontroller = TextEditingController();

  @override
  void initState() {
    taskController.text = widget.taskModel.task;
    taskdetailcontroller.text = widget.taskModel.task;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Task Name',
                prefixIcon: Icon(Icons.add_comment),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: taskdetailcontroller,
              decoration: const InputDecoration(
                hintText: 'Task Detail',
                prefixIcon: Icon(Icons.add_comment),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var task = taskController.text;
                var taskdetail = taskdetailcontroller.text;
                if (task.isEmpty && taskdetail.isEmpty) {
                  Fluttertoast.showToast(msg: 'Please provide task Detail');
                  return;
                }

                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  var taskRef = FirebaseDatabase.instance
                      .ref()
                      .child('tasks')
                      .child(user.uid);

                  await taskRef
                      .child(widget.taskModel.taskId)
                      .update({'task': task, taskdetail: taskdetail});

                  Navigator.of(context).pop();
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'UPDATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
