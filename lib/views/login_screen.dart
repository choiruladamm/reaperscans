// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:reaperscans/views/home_screen.dart';

const users = {
  'adam@gmail.com': 'adam',
};

class LoginScreen extends StatelessWidget {
  
  Duration get loginTime => Duration(milliseconds: 1250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User tidak ada';
      }
      if (users[data.name] != data.password) {
        return 'Password salah';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Masukkan email dan pasword dengan benar';
      }
      return 'null';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Comics',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Colors.black,
        
        cardTheme: CardTheme(
          color: Colors.red,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}