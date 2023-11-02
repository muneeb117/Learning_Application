import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(String text) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    // leading: IconButton(
    //   onPressed: () {},
    //   icon: Icon(Icons.arrow_back_ios_new),
    // ),
    title: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.primaryText),

    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildThirdParyPlugin(
            iconPath: "assets/icons/google.png", onPressed: () {}),
        const SizedBox(
          width: 50,
        ),
        buildThirdParyPlugin(
            iconPath: "assets/icons/apple.png", onPressed: () {}),
        const SizedBox(
          width: 50,
        ),
        buildThirdParyPlugin(
            iconPath: "assets/icons/facebook.png", onPressed: () {}),
      ],
    ),
  );
}

GestureDetector buildThirdParyPlugin(
    {required String iconPath, Function()? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset(iconPath),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String text, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17),
          width: 16.w,
          height: 16.h,
          child: Image.asset("assets/icons/${iconName}.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (value) {
              func!(value);
            },
            decoration: InputDecoration(
                hintText: text,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle:
                    TextStyle(color: AppColors.primarySecondaryElementText)),
            autocorrect: true,
            obscureText: textType == "password" ? true : false,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 12.sp),
        )),
  );
}

Widget buildLoginAndRegButton(
    String buttonName, String buttonColor, Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: buttonColor == "blue"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: buttonColor == "blue"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonColor == "blue"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}
