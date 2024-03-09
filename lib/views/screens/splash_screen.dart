import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/views/screens/auth/sign_up_screen.dart';
import 'package:resume_app/views/screens/resume_screen/view_resume_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewResumeScreen(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
