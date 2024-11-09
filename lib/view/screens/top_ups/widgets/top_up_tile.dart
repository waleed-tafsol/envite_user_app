import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopUpListTile extends StatefulWidget {
  final String userType;
  final String eventType;
  // final String pricePerInvite;
  const TopUpListTile({
    super.key,
    required this.userType,
    required this.eventType,
  });

  @override
  State<TopUpListTile> createState() => _TopUpListTileState();
}

class _TopUpListTileState extends State<TopUpListTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Checkbox(
          //     fillColor: WidgetStatePropertyAll(
          //         _isSelected ? AppColors.kBerkeleyBlue : Colors.transparent),
          //     value: _isSelected,
          //     onChanged: (val) {
          //       setState(() {
          //         _isSelected = val ?? false;
          //       });
          //     }),
        
          // SizedBox(
          //   width: 2.w, // Responsive spacing between elements
          // ),
          // Column to display event details (Event Name)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User", // Label for the event name
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                widget.userType, // Event name
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: 2.w, // Responsive spacing
          ),
          // Column to display planner details
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Type", // Label for the planner
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                widget.eventType, // Planner name
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: 2.w,
          ),
          // Column to display event date
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Created Date", // Label for the date
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "24 / 09 / 2024", // Event date
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: 2.w,
          ),
          // Column to display event location
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price Per Invite", // Label for location
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                '55', // Event location
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: 2.w,
          ),
          // Column to display max subscribers
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Status", // Label for subscribers
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Active", // Number of subscribers
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kBerkeleyBlue,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          // const Spacer(), // Spacer to push the next icons to the right
          // // Info button
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, EditTopUPScreen.routeName);
          //   },
          //   child: Container(
          //     width: 30,
          //     height: 30,
          //     decoration: kWhiteRoundedBoxDecoration,
          //     child: Center(child: SvgPicture.asset(SvgAssets.edit)),
          //   ),
          // ),

          // SizedBox(
          //   width: 1.w,
          // ),
          // SvgPicture.asset(SvgAssets.Delete)
        ],
      ),
      // Content to be displayed when the ExpansionTile is expanded
    );
  }
}
