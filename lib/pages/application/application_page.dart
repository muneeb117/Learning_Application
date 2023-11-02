import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/application/application_widgets.dart';
import 'package:ulearning/pages/application/bloc/app_blocs.dart';
import 'package:ulearning/pages/application/bloc/app_events.dart';
import 'package:ulearning/pages/application/bloc/app_states.dart';

import '../../common/values/colors.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs,AppStates>(builder: (context,state){
      return Scaffold(
        body: buildPage(state.index),
        bottomNavigationBar: Container(
          height: 58.h,
          width: 375.w,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1
                ),
              ],
          ),
          child:  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: state.index,
            onTap: (value) {
              context.read<AppBlocs>().add(TriggeredEvents(value));
            },
            elevation: 0,
            items: bottomTabs
          ),
        ),

      );
    });

  }
}
