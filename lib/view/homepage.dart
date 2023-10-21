import 'package:flutter/material.dart';
import 'package:todolist/view/add_taskscreen.dart';
import 'package:todolist/view/tasklist.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
   int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: Drawer(
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
),
      appBar: AppBar(
        title: const Text("To Do ListApp"),
        titleSpacing: 4,
        
        titleTextStyle: const TextStyle(color: Color.fromARGB(255, 17, 17, 17), fontSize: 20, fontWeight: FontWeight.bold),
      
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.login_outlined))
        ],),
  
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddTaskScreen()));
        },
        child: const Icon(Icons.add),),
      
        body:Tasklist(),
       bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_rounded),
            label: 'Add',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_3_rounded),
            icon: Icon(Icons.person_3_rounded),
            label: 'profile',
          ),
        ],
      ),
        
        
    );
    
  }
}


