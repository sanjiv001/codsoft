// ignore_for_file: dead_code

import 'package:flutter/material.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: 400,
          color: Colors.amberAccent,
          child: Column(children: [
            SizedBox(height: 40,),
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                        disabledBorder:  OutlineInputBorder(
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
                   const SizedBox(
                    height: 10
                  ),
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintMaxLines: 6,
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
                        disabledBorder:  OutlineInputBorder(
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
                  const SizedBox(height: 40),
                       Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 46,
                      width: 160,
                      child: ElevatedButton(
                      
                           onPressed: () {
                           
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
