import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do ListApp"),
        titleSpacing: 4,
        
        titleTextStyle: const TextStyle(color: Color.fromARGB(255, 17, 17, 17), fontSize: 20, fontWeight: FontWeight.bold),
      
        centerTitle: true,),
      
        
    );
  }
}