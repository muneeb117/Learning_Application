import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/bloc/home_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_events.dart';
import 'package:ulearning/pages/home/bloc/home_states.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

import '../../common/values/colors.dart';
import '../../common/widgets/build_dot.dart';
import '../welcome/welcome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocs, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomScrollView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 40.h),
                ),

                SliverToBoxAdapter(child: builtText(text: "Hello,")),
                SliverToBoxAdapter(
                    child: builtText(text: "Muneeb", color: Colors.black)),

                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(child: builtSearchField()),
                SliverPadding(
                  padding: EdgeInsets.only(top: 15.h),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    height: 130.h,
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        onPageChanged: (value) {
                          state.page = value;
                          BlocProvider.of<HomeBlocs>(context).add(HomeEvents());

                          // setState(() {
                          //   currentPage = value;
                          // });
                        },
                        itemBuilder: (context, index) {
                          return buildContainer(image: data[index]["image"]);
                        }),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          data.length, (index) => buildDot(index, state.page))),
                ),
                // buildContainer("Image(1)"),
                SliverPadding(
                  padding: EdgeInsets.only(top: 15.h),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      buildText("Choose Your Course", FontWeight.w600,
                          Colors.black, 19),
                      Spacer(),
                      buildText("See All", FontWeight.w400, Colors.grey, 16)
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 44.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: litems.length,
                        itemBuilder: (context, index) {
                          return buildCourseFields(litems[index], () {
                            // setState(() {
                            //   tapIndex = index;
                            // });
                            state.tapIndex = index;
                            BlocProvider.of<HomeBlocs>(context)
                                .add(HomeEvents());
                          },
                              state.tapIndex == index
                                  ? AppColors.primaryElement
                                  : Colors.transparent,
                              state.tapIndex == index
                                  ? Colors.white
                                  : Colors.grey);
                        }),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 1.6),
                    delegate: SliverChildBuilderDelegate(childCount: 4,
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/icons/Image.png",
                                  ))),
                          child: const Padding(
                            padding:  EdgeInsets.only(bottom: 20.0,left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("the best it course in town ",
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 11,
                                    )),
  SizedBox(height: 5,),
                                Text("ever  Course ",
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.primaryFourElementText,
                                      fontSize: 8,
                                    ),),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
