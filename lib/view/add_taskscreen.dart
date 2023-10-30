// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/view/homepage.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskController = TextEditingController();
  final taskdetailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Task")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: 480,
          color: Colors.amberAccent,
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: taskController,
                decoration: InputDecoration(
                  hintMaxLines: 6,
                  hintText: "Enter Task",
                  hintStyle: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 12, 16)),
                  fillColor: Color.fromARGB(255, 242, 242, 242),
                  filled: true,
                  focusColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(31, 161, 33, 33),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 6,
                controller: taskdetailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Task Detail",
                  hintStyle: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 12, 16)),
                  fillColor: Color.fromARGB(255, 242, 242, 242),
                  filled: true,
                  focusColor: Colors.blue,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(31, 185, 106, 106),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 46,
                width: 160,
                child: ElevatedButton(
                  onPressed: () async {
                    String task = taskController.text.trim();
                    String taskdetail = taskController.text.trim();
                    if (task.isEmpty && taskdetail.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Please provide tasks Information');
                      return;
                    }

                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      String uid = user.uid;
                      int dt = DateTime.now().millisecondsSinceEpoch;

                      DatabaseReference taskRef = FirebaseDatabase.instance
                          .ref()
                          .child('tasks')
                          .child(uid);

                      String? taskId = taskRef.push().key;

                      await taskRef.child(taskId!).set({
                        'dt': dt,
                        'task': task,
                        'taskdetail': taskdetail,
                        'taskId': taskId,
                      });
                      Fluttertoast.showToast(msg: 'Task Added');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homescreen()));
                    } ;
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class AddTaskScreen extends StatefulWidget {
//   const AddTaskScreen({Key? key}) : super(key: key);

//   @override
//   State<AddTaskScreen> createState() => _AddTaskScreenState();
// }

// class _AddTaskScreenState extends State<AddTaskScreen> {

//   var taskController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Task'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//              TextField(
//               controller: taskController,
//               decoration: const InputDecoration(
//                 hintText: 'Task Name'
//               ),
//             ),

//             const SizedBox(height: 10,),

//             ElevatedButton(onPressed: () async{

//               String taskName = taskController.text.trim();

//               if( taskName.isEmpty){
//                 Fluttertoast.showToast(msg: 'Please provide task name');
//                 return;
//               }

//               User? user = FirebaseAuth.instance.currentUser;

//               if( user != null ){

//                 String uid = user.uid;
//                 int dt = DateTime.now().millisecondsSinceEpoch;

//                 DatabaseReference taskRef = FirebaseDatabase.instance.reference().child('tasks').child(uid);

//                 String? taskId = taskRef.push().key;

//                 await taskRef.child(taskId!).set(
//                   {
//                     'dt': dt,
//                     'taskName': taskName,
//                     'taskId': taskId,
//                   }
//                 );

//               }

//               }, child: const Text('Save')),

//           ],
//         ),
//       ),
//     );
//   }
// }