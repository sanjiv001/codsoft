
// import 'package:flutter/material.dart';

// class Tasklist extends StatefulWidget {
//   const Tasklist({super.key});

//   @override
//   State<Tasklist> createState() => _TasklistState();
// }

// class _TasklistState extends State<Tasklist> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: 340,
//               height: 800,
//                color:Color.fromARGB(255, 128, 190, 240),
//             ),
//           ),
//         );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/view/add_taskscreen.dart';
import 'package:todolist/view/login.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  User? user;
  DatabaseReference? taskRef;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      taskRef =
          FirebaseDatabase.instance.reference().child('tasks').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Tasks List'),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return ProfileScreen();
                // }));
              },
              icon: Icon(Icons.person)),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddTaskScreen();
          }));
        },
      ),
      body: StreamBuilder(
        stream: taskRef != null ? taskRef!.onValue : null,
        builder: (context, snap) {
          if (snap.hasData && !snap.hasError) {
            var event = snap.data ;
            print(event.toString());
            var snshot = event!.snapshot.value;

            if( snshot == null ){
              return Center(child: Text('No tasks yet'));
            }

            Map<String, dynamic> map = Map<String, dynamic>.from(snshot);
            print(map.toString());
            var tasks = <TaskModel>[];

            for (var taskMap in map.values) {
              tasks.add(TaskModel.fromMap(Map<String, dynamic>.from(taskMap)));
            }
            print(tasks.length);

            return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  TaskModel taskModel = tasks[index];

                  return Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(taskModel.task),
                            Text(taskModel.taskdetail),
                            Text(getHumanReadableDate(taskModel.dt))
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  if (taskRef != null) {
                                    // show alertdialog

                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (ctx) {
                                          return AlertDialog(
                                            title: Text('Confirmation'),
                                            content: Text(
                                                'Are you sure to delete ?'),
                                            actions: [
                                              TextButton(onPressed: () {
                                                Navigator.of(ctx).pop();
                                              }, child: Text('No')),


                                              TextButton(onPressed: () async {
                                                try {
                                                  await taskRef!
                                                      .child(taskModel.nodeId)
                                                      .remove();

                                                }
                                                catch ( e ){
                                                print(e.toString());
                                                Fluttertoast.showToast(msg: 'failed');
                                                }

                                                Navigator.of(ctx).pop();

                                              }, child: Text('Yes')),
                                            ],
                                          );
                                        });
                                  }
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  //   return UpdateTaskScreen(taskModel: taskModel);
                                  // }));

                                }, icon: Icon(Icons.edit)),
                          ],
                        ),
                      )
                    ]),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )

    );
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}