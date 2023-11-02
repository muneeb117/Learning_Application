import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 12.h,
              width: 15.w,
              child: Image.asset("assets/icons/menu.png")),
          GestureDetector(
            child: Container(
              width: 15.w,
              height: 15.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(

                      image: AssetImage('assets/icons/person.png'))),
            ),
          )
        ],
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
  );
}
Widget buildCourseFields(String text, Function()? press, Color color,Color textColor) {
  return GestureDetector(
    onTap: press,
    child: Container(
      margin: const EdgeInsets.only(right: 20, top: 20),
      height: 30.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style:  TextStyle(
            color: textColor,
            fontSize: 12,
          ),
        ),
      ),
    ),
  );
}

Widget buildCourseContainer(Color color) {
  return Container(
    height: 120.h,
    width: 135.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: color,
    ),
  );
}

Widget buildContainer({required String? image}) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/icons/${image}.png"),
          )));
}

List<Map<String, String>> data = [
  {"image": "Image(1)"},
  {"image": "Image(2)"},
  {"image": "Image"}
];
List<String> litems = [
  "All",
  "Popular",
  "Newest",
];

Text buildText(String text,FontWeight fontWeight,Color color,double fontsize) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight),
  );
}

Row builtSearchField() {
  return Row(
    children: [
      Container(
        height: 40.h,
        width: 270.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1)
            ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              height: 40.h,
              width: 200.w,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search Your Course...",
                  hintStyle: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Image.asset("assets/icons/img.png"),
      ),
    ],
  );
}
Widget builtText({required String text, color=Colors.grey}) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ));
}