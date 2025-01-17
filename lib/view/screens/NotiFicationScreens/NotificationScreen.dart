import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/SearchEventWidget.dart';
import 'Widgets/MynotificationTile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const routeName = "NotificationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "My notifications",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: const SearchEventWidget(),
            ),
            SizedBox(
              height: 28.sp,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MynotificationTile();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
