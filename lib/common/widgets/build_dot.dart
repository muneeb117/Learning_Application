
import 'package:flutter/cupertino.dart';

import '../values/colors.dart';

AnimatedContainer buildDot(int index, int currentPage) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin:const EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
      color: currentPage == index ? AppColors.primaryElement :AppColors.primaryThreeElementText,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}