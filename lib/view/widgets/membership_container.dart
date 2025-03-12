import 'dart:convert';

import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart'
    show authService;
import 'package:event_planner_light/model/SubscriptionModel.dart';
import 'package:event_planner_light/utills/ConvertDateTime.dart';
import 'package:event_planner_light/utills/string_decoration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/ApiConstant.dart';
import '../../utills/CustomSnackbar.dart';

class MembershipContainer extends StatefulWidget {
  const MembershipContainer({super.key, this.subscription});
  final Subscriptions? subscription;

  @override
  State<MembershipContainer> createState() => _MembershipContainerState();
}

class _MembershipContainerState extends State<MembershipContainer> {
  bool _isLoading = false;

  Future<void> canclePackages(String? id) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.patch(
          Uri.parse(ApiConstants.cancleSubscription),
          body: jsonEncode({"subscriptionId": id}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        // final List<dynamic> data = jsonResponse['data'];
        CustomSnackbar.showSuccess(
            'Success', 'Subscription canceled successfully');
        authService.getMe();
        // packages.value = data.map((e) => PackagesModel.fromJson(e)).toList();
      } else {
        throw Exception(jsonResponse["message"]["error"][0]);
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff457B9D))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalizeFirstLetter(
                          widget.subscription?.eventType ?? ""),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '\$${widget.subscription?.price ?? 0}/',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: AppColors.kBerkeleyBlue),
                          children: [
                            TextSpan(
                              text: widget.subscription?.price == 0
                                  ? "Free"
                                  : capitalizeFirstLetter(
                                      widget.subscription?.type ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.kBerkeleyBlue),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Validity",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "From: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: AppColors.kBerkeleyBlue,
                                      fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: convertToDateFormat(
                                      widget.subscription?.startDate ?? ""),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: AppColors.kBerkeleyBlue,
                                      ),
                                )
                              ]),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Till: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: AppColors.kBerkeleyBlue,
                                      fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: convertToDateFormat(
                                      widget.subscription?.startDate ?? ""),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: AppColors.kBerkeleyBlue,
                                      ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '${widget.subscription?.totalInvites ?? 0}/',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: AppColors.kBerkeleyBlue),
                          children: [
                            TextSpan(
                              text: "Invites",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.kBerkeleyBlue),
                            )
                          ]),
                    ),
                    // Text(
                    //   'See Benefits',
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyLarge!
                    //       .copyWith(color: AppColors.kBerkeleyBlue),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 2.w),
                    //   child: BulletPoints(
                    //     items: [
                    //       'Limited invites',
                    //       'Online support',
                    //       'View exclusif events',
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                Spacer(),
                Text(
                    widget.subscription?.isSubscriptionExpired ?? false
                        ? "Expired"
                        : "Active",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color:
                            widget.subscription?.isSubscriptionExpired ?? false
                                ? Colors.red
                                : Colors.green)),
                // Spacer(),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.kPrimaryColor,
                    foregroundColor: Colors.white),
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('Cancel'),
                onPressed: () {
                  canclePackages(widget.subscription?.subscription);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
