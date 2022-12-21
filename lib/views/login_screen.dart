// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:reaperscans/views/home_screen.dart';

// const users = {
//   'adam@gmail.com': 'adam',
// };

// class LoginScreen extends StatelessWidget {

//   Duration get loginTime => Duration(milliseconds: 1250);

//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User tidak ada';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password salah';
//       }
//       return null;
//     });
//   }

//   Future<String?> _signupUser(SignupData data) {
//     debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }

//   Future<String> _recoverPassword(String name) {
//     debugPrint('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'Masukkan email dan pasword dengan benar';
//       }
//       return 'null';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'Comics',
//       onLogin: _authUser,
//       onSignup: _signupUser,
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => HomeScreen(),
//         ));
//       },
//       onRecoverPassword: _recoverPassword,
//       theme: LoginTheme(
//         primaryColor: Colors.black,

//         cardTheme: CardTheme(
//           color: Colors.red,
//           elevation: 5,
//           margin: EdgeInsets.only(top: 15),

//         ),
//         inputTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.zero,
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
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
