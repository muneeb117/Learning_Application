import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_events.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_states.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_controller.dart';
import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar("Login"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText('Or use your email account to login')),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextField("Enter you email address", 'email', "user",
                        (value) {
                      context.read<SignInBlocs>().add(EmailEvents(value));
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableText('Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextField("Enter you Password", 'password', "lock",
                        (value) {
                      context.read<SignInBlocs>().add(PasswordEvents(value));
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    forgotPassword(),
                    buildLoginAndRegButton("Login", "blue", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    buildLoginAndRegButton("Register", "register", () {
                      Navigator.pushNamed(context, "/register");
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
