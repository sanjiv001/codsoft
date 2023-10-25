// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:todolist/view/homepage.dart';
import 'package:todolist/view/login.dart';

class SignUpScreeen extends StatefulWidget {
  const SignUpScreeen({super.key});

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 510,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                "SignUp Now",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 4, 88, 157),
                    fontWeight: FontWeight.w900),
              )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    hintMaxLines: 3,
                    hintText: "Username",
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    hintStyle: const TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 8, 12, 16)),
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(31, 179, 58, 58),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintMaxLines: 6,
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Email",
                    labelText: "Email",
                    hintStyle: const TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 8, 12, 16)),
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(31, 221, 74, 74),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
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
                        fontSize: 10, color: Color.fromARGB(255, 8, 12, 16)),
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(31, 214, 68, 68),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                    hintMaxLines: 6,
                    hintText: " Confirm Password",
                    labelText: " Confirm Password",
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye_outlined)),
                    hintStyle: const TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 8, 12, 16)),
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(31, 214, 68, 68),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () async {
                        var fullName = fullNameController.text.trim();
                        var email = emailController.text.trim();
                        var password = passwordController.text.trim();
                        var confirmPass = confirmController.text.trim();

                        if (fullName.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            confirmPass.isEmpty) {
                          // show error toast

                          Fluttertoast.showToast(msg: 'Please fill all fields');
                          return;
                        }

                        if (password.length < 6) {
                          // show error toast
                          Fluttertoast.showToast(
                              msg:
                                  'Weak Password, at least 6 characters are required');

                          return;
                        }

                        if (password != confirmPass) {
                          // show error toast
                          Fluttertoast.showToast(msg: 'Passwords do not match');

                          return;
                        }

                        // request to firebase auth

                        ProgressDialog progressDialog = ProgressDialog(
                          context,
                          title: const Text('Signing Up'),
                          message: const Text('Please wait'),
                        );
                        progressDialog.show();
                        // try and catch
                        try {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          UserCredential userCredential =
                              await auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                      
                          //  store user information in Realtime database
                            DatabaseReference userRef = FirebaseDatabase
                                .instance
                                .reference()
                                .child('users');

                            String uid = userCredential.user!.uid;
                            int dt = DateTime.now().millisecondsSinceEpoch;
                            await userRef.child(uid).set({
                              'fullName':fullName,
                              'password':password,
                              'email': email,
                              'dt': dt,
                              'uid': uid,
                              
                            });
                            
                             if( userCredential.user != null ){


                   progressDialog.dismiss();
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                     return  Homescreen();
                   }));
                }
                          
                        } on FirebaseAuthException catch (e) {
                          progressDialog.dismiss();
                          if (e.code == 'email-already-in-use') {
                            Fluttertoast.showToast(
                                msg: 'Email is already in Use');
                          } else if (e.code == 'weak-password') {
                            
                            Fluttertoast.showToast(msg: 'Password is weak');
                          }
                        } catch (e) {
                          progressDialog.dismiss();
                          Fluttertoast.showToast(msg: 'Something went wrong');
                        }
                        ;
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            color: Color.fromARGB(255, 12, 12, 12),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        const Text(
                          "Already Have an Account!!!",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              "LogIn",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ))
                      ],
                    ),
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
