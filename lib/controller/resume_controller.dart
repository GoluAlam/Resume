import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resume_app/models/resume_model.dart';
import 'package:resume_app/views/screens/resume_screen/create_resume_screen.dart';
import 'package:resume_app/views/screens/resume_screen/view_resume_screen.dart';

class ResumeController{
  BuildContext context;
  ResumeController({required this.context});

  var user = FirebaseAuth.instance.currentUser!.uid;
  final _firebaseFireStore = FirebaseFirestore.instance;


  createResume(ResumeModel resumeModel){
    _firebaseFireStore.collection('resume').doc(FirebaseAuth.instance.currentUser!.uid).set(resumeModel.toJson()).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewResumeScreen(),));
    });
  }

  updateResume(ResumeModel resumeModel, {required String id}){
    _firebaseFireStore.collection('resume').doc(id).update(resumeModel.toJson()).then((value){
      Fluttertoast.showToast(msg: 'Resume Update Successfully');
    });
  }

  deleteResume(String id){
    _firebaseFireStore.collection('resume').doc(id).delete().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateResumeScreen(),));
      Fluttertoast.showToast(msg: 'Resume Delete Successfully');
    });
  }



}