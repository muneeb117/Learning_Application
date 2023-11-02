import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_event.dart';
import 'package:ulearning/pages/register/register_controller.dart';

import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Sign Up"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: reusableText('Enter your details below & free Sign up')),
            Container(
              margin: EdgeInsets.only(top: 36.h),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText('User Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField("Enter you user Name", 'email', "user",
                      (value) {
                     context.read<RegisterBloc>().add(UserNameEvent(value));
                  }),
                  reusableText('Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField("Enter you email address", 'email', "user",
                      (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                  }),
                  reusableText('Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField("Enter you Password", 'password', "lock",
                      (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                  }),
                  reusableText('Confirm Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField(
                      "Enter you Confirm Password", 'password', "lock",
                      (value) {
                        context.read<RegisterBloc>().add(RePasswordEvent(value));
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  reusableText("By Creating an account you have to agree with our term's & condition"),
                  const SizedBox(
                    height: 30,
                  ),
                  buildLoginAndRegButton("Sign Up", "blue", () {
                    RegisterController(context:context).handleSignUp();

                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
