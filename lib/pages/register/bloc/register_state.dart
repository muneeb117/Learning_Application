import 'package:ulearning/pages/register/register.dart';

class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  const RegisterState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterState copyWith({String? userName, String? email, String? password, String? rePassword}) {
    return RegisterState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        email: email ?? this.email,
        rePassword: rePassword ?? this.rePassword);
  }
}
