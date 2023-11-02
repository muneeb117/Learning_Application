import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';


class AppBlocProviders {
  static get allBlocProvider => [
    BlocProvider(create: (BuildContext context) => WelcomeBloc(),),
    BlocProvider(create: (BuildContext context) => SignInBlocs()),
    BlocProvider(create: (BuildContext context) => RegisterBloc()),
    BlocProvider(create: (BuildContext context) => AppBlocs()),


  ];
}
