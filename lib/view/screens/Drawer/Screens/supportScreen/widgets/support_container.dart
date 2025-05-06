import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportContainer extends StatelessWidget {
  const SupportContainer(
      {super.key, required this.title, required this.subTitle, this.image});

  final String title;
  final String? image;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF1F5ED),
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: image == null
                      ? null
                      : DecorationImage(
                          image: NetworkImage(image!), fit: BoxFit.contain),
                  color: AppColors.kTextfieldColor,
                  borderRadius: BorderRadius.circular(10)),
              child: image != null
                  ? null
                  : Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBerkeleyBlue, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 0.7.h,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
