import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resume_app/views/screens/auth/sign_in_screen.dart';
import 'package:resume_app/views/screens/resume_screen/create_resume_screen.dart';

class AuthController{
  BuildContext context;
  AuthController({required this.context});
  final _auth = FirebaseAuth.instance;

  createAccountWithEmailAndPassword(String email,String password){
    _auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
      Fluttertoast.showToast(msg: 'Create Account Successfully');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
    });
  }

  signInAccountWithEmailAndPassword(String email,String password){
    _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      Fluttertoast.showToast(msg: 'SignIn Account Successfully');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateResumeScreen(),));
    });

  }

}