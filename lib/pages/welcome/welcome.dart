import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/constants.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';
import '../../common/values/colors.dart';
import '../../common/widgets/build_dot.dart';
import '../../global.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                },
                children: [
                  _page(
                      1,
                      context,
                      'Next',
                      'First see Learning',
                      'Forget about a paper all knowledge in on learning',
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      'Next',
                      'Connect With EveryOne',
                      "Always Keep in touch with Your tutor&Friend\nLet's get Connected",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      'Get Started',
                      'Always Fascinated Learning',
                      'Anywhere,Anytime. The time is at our discretion so study whenever you want',
                      "assets/images/man.png"),
                ],
              ),
              Positioned(
                bottom: 120.h,
                child: Row(
                  children: List.generate(3, (index) {
                    return buildDot(index, state.page);
                  }),
                ),
              )

              // child: DotsIndicator(
              //   position: state.page,
              //   dotsCount: 3,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   decorator: DotsDecorator(
              //       color: Colors.grey,
              //       activeColor: Colors.blue,
              //       size: const Size.square(8.0),
              //       activeSize: Size(20.0, 8.0),
              //       activeShape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       )),
              // ),
            ],
          );
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        //container for onboarding images
        Container(
          margin: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
          height: 345.w,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        //title onboarding
        Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.primaryText,
            ),
          ),
        ),
        //subtitle onboarding
        Container(
          height: 80.h,
          width: 375.w,
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Center(
            child: Text(
              subtitle,
              maxLines: 2,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.primarySecondaryElementText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        //button
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Global.storageServices.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil("/signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                     color: Colors.grey.withOpacity(0.1),

                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
//to generate the dot on screen

}
