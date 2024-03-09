import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resume_app/views/utils/app_widgets/app_widgets.dart';
import '../../../controller/resume_controller.dart';
import '../../../models/resume_model.dart';

class UpdateResumeScreen extends StatefulWidget {
  final data;
  const UpdateResumeScreen({super.key, required this.data});

  @override
  State<UpdateResumeScreen> createState() => _UpdateResumeScreenState();
}

class _UpdateResumeScreenState extends State<UpdateResumeScreen> {
  final _formFieldKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _higherQualificationController = TextEditingController();
  final _universityController = TextEditingController();
  final _skillsController = TextEditingController();
  final _previousCompanyNameController = TextEditingController();
  final _currentLocationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _projectController = TextEditingController();
  final _hobbiesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.data['firstName'];
    _lastNameController.text = widget.data['lastName'];
    _emailController.text = widget.data['email'];
    _phoneNumberController.text = widget.data['phoneNumber'];
    _addressController.text = widget.data['address'];
    _qualificationController.text = widget.data['qualification'];
    _higherQualificationController.text = widget.data['higherQualification'];
    _universityController.text = widget.data['university'];
    _skillsController.text = widget.data['skills'];
    _previousCompanyNameController.text = widget.data['previousCompanyName'];
    _currentLocationController.text = widget.data['currentLocation'];
    _experienceController.text = widget.data['experience'];
    _projectController.text = widget.data['project'];
    _hobbiesController.text = widget.data['hobbies'];

  }

  @override
  Widget build(BuildContext context) {
    final resumeController = ResumeController(context: context);
    var view = AppWidgets();
    return Scaffold(
      appBar: view.appBarView(
        backgroundColor: Colors.blue,
        title: Text('Update Your Resume'),
        centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formFieldKey,
              child: Column(
                children: [
                  const Text('Personal Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  view.sizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: view.textFormField(
                          controller: _firstNameController,
                          labelText: 'Enter Your First Name',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your First Name!';
                            }
                            return null;
                          },
                        ),
                      ),
                      view.sizedBox(width: 5),
                      Expanded(
                        child: view.textFormField(
                          controller: _lastNameController,
                          labelText: 'Enter Your Last Name',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Last Name!';
                            }
                            return null;
                          },
                        ),
                      ),

                    ],
                  ),
                  view.sizedBox(height: 15),
                  Row(
                    children: [
                      // view.sizedBox(height: 15),
                      Expanded(
                        child: view.textFormField(
                          controller: _emailController,
                          labelText: 'Enter Your Email',
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ),
                      view.sizedBox(width: 5),
                      Expanded(
                        child: view.textFormField(
                          controller: _phoneNumberController,
                          labelText: 'Enter Your Phone Number',
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Number';
                            }
                            return null;
                          },
                        ),
                      ),

                    ],
                  ),
                  view.sizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: view.textFormField(
                          controller: _addressController,
                          labelText: 'Enter Your Address',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Address';
                            }
                            return null;
                          },
                        ),
                      ),
                      view.sizedBox(width: 5),
                      Expanded(
                        child: view.textFormField(
                          controller: _currentLocationController,
                          labelText: 'Enter Your Current Location',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Current Location';
                            }
                            return null;
                          },
                        ),
                      ),

                    ],
                  ),
                  view.sizedBox(height: 15),
                  const Text('Education Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _qualificationController,
                    labelText: 'Enter Your Qualification',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Qualification';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _higherQualificationController,
                    labelText: 'Enter Your Higher Qualification',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Higher Qualification';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _universityController,
                    labelText: 'Enter Your University',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your University';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),
                  const Text('Skills Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _skillsController,
                    labelText: 'Enter Your Skills',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Skills';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _previousCompanyNameController,
                    labelText: 'Enter Your Previous Company Name',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Previous Company Name';
                      }
                      return null;
                    },
                  ),

                  view.sizedBox(height: 15),

                  view.textFormField(
                    controller: _experienceController,
                    labelText: 'Enter Your Experience',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Experience';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),

                  view.textFormField(
                    controller: _projectController,
                    labelText: 'Enter Your Project',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Project';
                      }
                      return null;
                    },
                  ),
                  view.sizedBox(height: 15),
                  const Text('Extra Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  view.sizedBox(height: 15),
                  view.textFormField(
                    controller: _hobbiesController,
                    labelText: 'Enter Your Hobbies',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                  ),
                  view.sizedBox(height: 15),
                  view.elevatedButton('Submit', onPressed: (){
                    if(_formFieldKey.currentState!.validate()){
                      resumeController.updateResume(ResumeModel(
                        address: _addressController.text,
                        currentLocation: _currentLocationController.text,
                        email: _emailController.text,
                        experience: _experienceController.text,
                        firstName: _firstNameController.text,
                        higherQualification: _higherQualificationController.text,
                        hobbies: _hobbiesController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _phoneNumberController.text,
                        previousCompanyName: _previousCompanyNameController.text,
                        project: _projectController.text,
                        qualification: _qualificationController.text,
                        skills: _skillsController.text,
                        university: _universityController.text,
                        id: FirebaseAuth.instance.currentUser!.uid
                      ), id: FirebaseAuth.instance.currentUser!.uid);

                      Fluttertoast.showToast(msg: 'Resume Create Successfully');
                      Navigator.pop(context);

                    }else{
                      Fluttertoast.showToast(msg: 'Something went wrong');
                    }

                  }),
                  view.sizedBox(height: 50)
                ],
              ),
            )
        ),
      ),
    );
  }
}
