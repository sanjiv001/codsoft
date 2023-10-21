import 'package:flutter/material.dart';
import 'package:todolist/view/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  
                const Positioned(
                   child:  Text(
                                 "Login Here",
                                 style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 4, 88, 157),
                      fontWeight: FontWeight.w900),
                               ),
                 ),
           
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintMaxLines: 6,
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.person_2_outlined),
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
                height: 10,
              ),
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                    hintMaxLines: 6,
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_outlined)),
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
              SizedBox(height: 40,),
                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 46,
                  width: 160,
                  child: ElevatedButton(
                  
                       onPressed: () {
                       
                      },
                      child: const Text(
                        
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Row(
                    children: [
                      const Text(
                        "Don't have an Account!!!",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreeen()));
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
