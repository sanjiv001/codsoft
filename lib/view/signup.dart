import 'package:flutter/material.dart';

class SignUpScreeen extends StatefulWidget {
  const SignUpScreeen({super.key});

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
        centerTitle: true,
      ),
      body: Center(
          
          child: Container(
            
            width: 300,
            height: 500,
            child: Column(
              
             mainAxisAlignment:MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                  TextFormField(
                    decoration: InputDecoration(
                      
                        hintMaxLines: 6,
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintStyle: const TextStyle(fontSize: 20,
                      color: Color.fromARGB(255, 8, 12, 16)),
                      fillColor: Color.fromARGB(255, 242, 242, 242),
                      filled: true,
                      focusColor: Colors.blue,
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ),
                        ), ),
                    
                    
                    ),
                    SizedBox(height: 10,),
                        TextFormField(
                    decoration: InputDecoration(
                        hintMaxLines: 6,
                        prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email",
                      hintStyle: const TextStyle(fontSize: 20,
                      color: Color.fromARGB(255, 8, 12, 16)),
                      fillColor: Color.fromARGB(255, 242, 242, 242),
                      filled: true,
                      focusColor: Colors.blue,
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ),
                        ), ),
                    
                    
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                   
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye_outlined,
                      ),
                        hintMaxLines: 6,
                      hintText: "Password",
                      prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined)),
                      hintStyle: const TextStyle(fontSize: 20,
                      color: Color.fromARGB(255, 8, 12, 16)),
                      fillColor: Color.fromARGB(255, 242, 242, 242),
                      filled: true,
                      focusColor: Colors.blue,
                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8,),
                        borderSide: const BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ),
                        ), ),
                    
                    
                    ),
                  
                  
                
              ],
            ),
          ),
        ),
    );
  }
}
