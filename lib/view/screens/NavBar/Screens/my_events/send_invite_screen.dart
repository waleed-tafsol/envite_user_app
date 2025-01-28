import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:event_planner_light/view/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SendInviteScreen extends StatelessWidget {
  static const routeName = 'SendInviteScreen';
  const SendInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        child: Column(children: [
          Center(
              child: Text(
            'Invites people to my exclusive event',
            style: Theme.of(context).textTheme.bodyLarge,
          )),
          Divider(),
          k3hSizedBox,
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipOval(
                        child: Image.asset(Assets.saad),
                      ),
                      title: Text(
                        'Saad  Ben Talha',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('+965 235 7685'),
                      trailing: CustomCheckbox(),
                    );
                  })),
          k3hSizedBox,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      BottomSheetManager.upgradEvent(context);
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
