import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:todolist/view/homepage.dart';
import 'package:todolist/view/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                  controller: emailController,
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
                  controller: passwordController,
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
                child: ElevatedButton(onPressed: () async {

              var email = emailController.text.trim();
              var password = passwordController.text.trim();
              if( email.isEmpty || password.isEmpty ){
                // show error toast
                Fluttertoast.showToast(msg: 'Please fill all fields');
                return;
              }

              // request to firebase auth

              ProgressDialog progressDialog = ProgressDialog(
                context,
                title: const  Text('Logging In'),
                message: const Text('Please wait'),
              );

              progressDialog.show();

              try{

                FirebaseAuth auth = FirebaseAuth.instance;

                UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

                if( userCredential.user != null ){


                   progressDialog.dismiss();
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                     return  Homescreen();
                   }));
                }



              }
              on FirebaseAuthException catch ( e ) {

                progressDialog.dismiss();

                if( e.code == 'user-not-found'){
                  Fluttertoast.showToast(msg: 'User not found');

                }else if( e.code == 'wrong-password'){
                  Fluttertoast.showToast(msg: 'Wrong password');

                }

              }
              catch(e){
                Fluttertoast.showToast(msg: 'Something went wrong');
                progressDialog.dismiss();
              }


            }, child:const  Text('Login')),
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
