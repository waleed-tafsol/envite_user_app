import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PackagesScreen extends StatelessWidget {
  static const routeName = 'PackagesScreen';
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packages'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Package',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Color(0xff457B9D)),
            ),
            k2hSizedBox,
            MembershipContainer(),
            MembershipContainer(),
            k1hSizedBox,
            Text(
              'Top Ups',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Color(0xff457B9D)),
            ),
            k2hSizedBox,
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return TopupContainer();
                    })),
          ],
        ),
      ),
    );
  }
}
