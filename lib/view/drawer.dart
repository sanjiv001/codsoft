import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      const SizedBox(height: 20,),
      const Padding(
        padding: const EdgeInsets.all(8.0),
        child: Divider(color: Colors.black, thickness: 2,),
      ),
      ListTile(
        leading: const Icon(Icons.person_3_rounded),
        title: const Text('Profile'),
        onTap: () {
         
        },
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Divider(color: Colors.black, thickness: 2,),
      ),
      ListTile(
      leading: const Icon(Icons.login_rounded),
        title: const Text('LogOut'),
        onTap: () {
        
        },
        
      ),
      const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Divider(color: Colors.black, thickness: 2,),
      ),
    ],
  ),
);
  }
}
