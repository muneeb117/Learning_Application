import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import '../../common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleSignUp() async {
    try {
        final state = context.read<RegisterBloc>().state;
        String userName = state.userName;
        String email = state.email;
        String password = state.password;
        String rePassword = state.rePassword;
        if (userName.isEmpty) {
          toastInfo(msg: "Your need to fill user Name");
          return;
        }
        if (email.isEmpty) {
          toastInfo(msg: "Your need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Your need to fill password address");
          return;
        }
        if (rePassword.isEmpty) {
          toastInfo(msg: "You Password confirmation is empty");
          return;
        }
        if(rePassword!=password){
          toastInfo(msg: "You confirm password is not matched");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          if (credential.user != null) {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(userName);
            toastInfo(msg: "Verification email has been sent to your account,check you email inbox for activation");
            Navigator.of(context).pop();
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "weak-password") {
            toastInfo(msg: "Your Password is not Strong");
          }
          if (e.code == "email-already-in-use") {
            toastInfo(
                msg:
                    "There is already exists an account with the given email address");
          }
          if (e.code == "invalid-email") {
            toastInfo(msg: "The email address is not valid.");
          }
        }

    } catch (e) {}
  }
}
