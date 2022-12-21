// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login method
  void loginEmail() async {
    // menampilkan loading
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );

    // try login email & password
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('salah email');
      } else if (e.code == 'wrong-password') {
        print('salah password');
      }
    }

    // pop loading
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // heading
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                  child: Icon(
                Icons.key,
                color: Colors.red,
                size: 120,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Login to your account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // email field
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 59, 59, 59),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(top: 10, left: 20),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // pasword field
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
              child: TextFormField(
                controller: passwordController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 59, 59, 59),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.only(top: 10, left: 20),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // text forgot
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            // button login
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: InkWell(
                onTap: loginEmail,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Log in with Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // another login
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'By creating an account, you accept Movie Clubs',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Terms of Service',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'and',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
