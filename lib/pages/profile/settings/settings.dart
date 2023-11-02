import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/name.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/pages/application/bloc/app_events.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/setting_state.dart';

import '../../../global.dart';
import '../../application/bloc/app_blocs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(TriggeredEvents(0));
    Global.storageServices.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<SettingBlocs, SettingStates>(
        builder: (BuildContext context, state) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Conform Logout"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  removeUserData();
                                },
                                child: Text("Conform"))
                          ],
                        );
                      });
                },
                child: Container(
                  height: 100.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/icons/Logout.png"),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
