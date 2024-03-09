import 'package:flutter/material.dart';
import 'package:resume_app/controller/auth_controller.dart';
import 'package:resume_app/views/utils/app_widgets/app_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authController = AuthController(context: context);
    var view = AppWidgets();
    return Scaffold(
      appBar: view.appBarView(
        backgroundColor: Colors.blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            view.textFormField(
              controller: _emailController,
              labelText: 'Enter your Email'
            ),
            view.sizedBox(height: 15),
            view.textFormField(
                controller: _passwordController,
                labelText: 'Enter your Password'
            ),
            view.sizedBox(height: 35),
            view.elevatedButton('SignUp', onPressed: (){
              authController.createAccountWithEmailAndPassword(_emailController.text.toString().trim(), _passwordController.text.toString().trim());

            })
          ],
        ),
      ),
    );
  }
}
