
import 'package:flutter/material.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 340,
              height: 800,
              color: Colors.amberAccent,
          
            ),
          ),
        );
  }
}