import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_event.dart';
import 'package:ulearning/pages/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {

    on<UserNameEvent>(_userNameEvent);
    on<PasswordEvent>(_passwordEvent);
    on<EmailEvent>(_emailEvent);
    on<RePasswordEvent>(_rePasswordEvent);

  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePasswrod));
  }
}

