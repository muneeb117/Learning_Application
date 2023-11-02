import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/profile.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index){
  List<Widget> _widgets=[
    HomePage(),
    Center(child: Text("search"),),
    Center(child: Text("other"),),
    Center(child: Text("other"),),
    ProfilePage()

  ];
  return _widgets[index];

}
var bottomTabs=[
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/search2.png")),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "course",
    icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/play-circle1.png")),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/message-circle.png")),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "person",
    icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/person2.png")),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];