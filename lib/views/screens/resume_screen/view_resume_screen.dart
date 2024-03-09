import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/controller/resume_controller.dart';
import 'package:resume_app/views/screens/resume_screen/create_resume_screen.dart';
import 'package:resume_app/views/screens/resume_screen/update_resume_screen.dart';
import 'package:resume_app/views/utils/app_widgets/app_widgets.dart';

class ViewResumeScreen extends StatefulWidget {
  const ViewResumeScreen({super.key});

  @override
  State<ViewResumeScreen> createState() => _ViewResumeScreenState();
}

class _ViewResumeScreenState extends State<ViewResumeScreen> {
  @override
  Widget build(BuildContext context) {
    final resumeController = ResumeController(context: context);
    var view = AppWidgets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('My resume',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('resume').doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text('Something went wrong'));
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CupertinoActivityIndicator());
          }
          if (!snapshot.hasData || snapshot.data?.data() == null) {
            return const Center(child: Text('No data available'));
          }

          var data = snapshot.data!.data()!;
          return SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Personal Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('First Name'),
                        Text(data['firstName'] ?? "firstName"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Last Name'),
                        Text(data['lastName'] ?? "lastName"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email'),
                        Text(data['email'] ?? "email"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Phone Number'),
                        Text(data['phoneNumber'] ?? "phoneNumber"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Address'),
                        Text(data['address'] ?? "address"),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 20,),
                    const Text('Educational Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Higher Qualification'),
                        Text(data['higherQualification']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Qualification'),
                        Text(data['qualification']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('University'),
                        Text(data['university']),
                      ],
                    ),
            
                    const Divider(),
                    const SizedBox(height: 20,),
                    const Text('Professional Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const Divider(),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Skills'),
                        Text(data['skills']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Project'),
                        Text(data['project']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Experience'),
                        Text(data['experience']),
                      ],
                    ),
            
                    const Divider(),
                    const SizedBox(height: 20,),
                    const Text('Extra Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    const Divider(),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hobbies'),
                        Text(data['hobbies']),
                      ],
                    ),
                    const SizedBox(height: 30,),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        view.elevatedButton('Update', onPressed: (){
                          view.nextScreenPush(context: context, screen: UpdateResumeScreen(data : data));
                        }),
                        view.elevatedButton('Delete', onPressed: (){
                          resumeController.deleteResume(data['id']);
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateResumeScreen(),));
        },child: const Icon(Icons.add),),
    );
  }
}
