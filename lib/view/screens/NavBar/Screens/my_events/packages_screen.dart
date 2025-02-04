import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../controllers/Auth_services.dart';
import '../../../Drawer/Screens/MembershipScreens/PaymentScreen.dart';

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
            Obx(() {
              final subscriptions = authService.me.value?.subscriptions;
              if (subscriptions == null || subscriptions.isEmpty) {
                return SizedBox(); // Return an empty widget if the list is null or empty
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subscriptions.map((item) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(PaymentScreen.routeName);
                        },
                        child: MembershipContainer(
                          price: item.price ?? 0,
                          type: item.type ?? "",
                        )),
                  );
                }).toList(),
              );
            }),
            k1hSizedBox,
            Text(
              'Top Ups',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Color(0xff457B9D)),
            ),
            k2hSizedBox,
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 4,
            //         itemBuilder: (context, index) {
            //           return TopupContainer();
            //         })),
          ],
        ),
      ),
    );
  }
}
