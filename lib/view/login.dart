import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Login Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 10, color: Colors.blue),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintMaxLines: 6,
                  hintText: "Username",
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                  hintMaxLines: 6,
                  hintText: "Password",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
