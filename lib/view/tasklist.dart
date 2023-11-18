import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  User? user;
  DatabaseReference? dbRef;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      dbRef = FirebaseDatabase.instance.ref().child('tasks').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: dbRef != null ? dbRef!.onValue : null,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text("No Data POsted"));
                    } else {
                      Map<Object?, dynamic> map = (snapshot.data!)
                          .snapshot
                          .value as Map<Object?, dynamic>;

                      List<dynamic> tlist = <TaskModel>[];

                      for (var taskMap in map.values) {
                        tlist.add(TaskModel.fromMap(
                            Map<String, dynamic>.from(taskMap)));
                      }

                      tlist.clear();
                      tlist = map.values.toList();
                      return ListView.builder(
                          itemCount: snapshot.data!.snapshot.children.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              
                              title: Text(tlist[index]['task']),
                              subtitle: Text(tlist[index]['taskdetail']),
                              trailing: PopupMenuButton(
                                  icon: const Icon(Icons.more_vert),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                        child:  ListTile(
                                          
                                            onTap: () {
                                           //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UpdateTaskScreen(TaskModel :taskModel)));
                                           //   result: Navigator.of(context).pop();
                                            },
                                            leading:const  Icon(Icons.edit
                                            ),
                                            title: Text("Edit"),
                                          
                                          
                                         
                                        )
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                        child:  ListTile(
                                          
                                            onTap: () {
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UpdateTaskScreen())
                                              Navigator.of(context).pop();
                                            },
                                            leading:const  Icon(Icons.delete
                                            ),
                                            title:const  Text("Delete"),
                                          
                                          
                                         
                                        )
                                        )
                                        
                                        ]
                                        )
                            );
                          });
                    }
                  })),
        ],
      ),
    );
  }
}
