import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/bloc_providers.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
 await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPage.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppPage.generateRouteSettings,
            );
          },
        ));
  }
}


