import 'package:ulearning/pages/register/register.dart';

abstract class RegisterEvent{
  const RegisterEvent();
}
class UserNameEvent extends RegisterEvent{
  final String userName;
  UserNameEvent(this.userName);
}
class EmailEvent extends RegisterEvent{
  final String email;
  EmailEvent(this.email);
}
class PasswordEvent extends RegisterEvent{
  final String password;
  PasswordEvent(this.password);
}
class RePasswordEvent extends RegisterEvent{
  final String rePasswrod;
  RePasswordEvent(this.rePasswrod);
}
