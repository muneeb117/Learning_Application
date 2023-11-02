

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/name.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_blocs.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:ulearning/pages/profile/settings/settings.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_blocs.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import '../../global.dart';
import '../../pages/register/register.dart';
import '../../pages/welcome/welcome.dart';

class AppPage {
  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.initial,
      page: const Welcome(),
      bloc: BlocProvider(
        create: (_) => WelcomeBloc(),
      ),
    ),
    PageEntity(
      route: AppRoutes.signIn,
      page: const SignIn(),
      bloc: BlocProvider(
        create: (_) => SignInBlocs(),
      ),
    ),
    PageEntity(
      route: AppRoutes.register,
      page: const Register(),
      bloc: BlocProvider(
        create: (_) => RegisterBloc(),
      ),
    ),
    PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        )),
    PageEntity(
        route: AppRoutes.home,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomeBlocs(),
        )),
    PageEntity(
        route: AppRoutes.settings,
        page: const SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingBlocs(),
        )),
  ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //model that covers entire screen
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen=Global.storageServices.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.initial && deviceFirstOpen){
          bool isloggedIn=Global.storageServices.getIsLoggedIn();
          if(isloggedIn){
            return MaterialPageRoute(builder: (_)=>ApplicationPage(),settings: settings);
          }
          return MaterialPageRoute(builder: (_)=>SignIn(),settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});

}

