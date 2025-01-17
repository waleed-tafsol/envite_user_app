import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/TextConstant.dart';
import '../../../../../../constants/assets.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../../../../../constants/constants.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    super.key,
  });

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int _selectedPaymentMethod = 0;

  void switchPaymentMethod(int index) {
    setState(() {
      _selectedPaymentMethod = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFF5F7EE)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Payment method",
            style: TextConstants.headlineLarge_MediumBlue_normal(context),
          ),
          SizedBox(
            width: 2.w,
          ),
          const Divider(
            color: AppColors.kBlueMediumShade,
          ),
          InkWell(
            onTap: () {
              switchPaymentMethod(0);
            },
            child: Row(
              children: [
                Icon(
                  _selectedPaymentMethod == 0
                      ? Icons.radio_button_checked_rounded
                      : Icons.circle_outlined,
                  color: AppColors.kBerkeleyBlue,
                ),
                SizedBox(
                  width: 4.w,
                ),
                SvgPicture.asset(
                  SvgAssets.my_fatoorah,
                  color: AppColors.kBerkeleyBlue,
                  height: 3.h,
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                Text(
                  "Myfatoorah",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: _selectedPaymentMethod == 0
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          const Divider(
            color: AppColors.kBlueMediumShade,
          ),
          InkWell(
            onTap: () {
              switchPaymentMethod(1);
            },
            child: Row(
              children: [
                Icon(
                  _selectedPaymentMethod == 1
                      ? Icons.radio_button_checked_rounded
                      : Icons.circle_outlined,
                  color: AppColors.kBerkeleyBlue,
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Icon(
                  Icons.credit_card_sharp,
                  color: AppColors.kBerkeleyBlue,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "Bank card",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: _selectedPaymentMethod == 1
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              ],
            ),
          ),
          Container(
            padding: kpaddingH4V2,
            decoration: BoxDecoration(
                borderRadius: k5BorderRadius, color: const Color(0xFFF1F5ED)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount",
                  style:
                      TextConstants.headlineMedium_MediumBlue_normal(context),
                ),
                Text(
                  "12 kd",
                  style:
                      TextConstants.headlineMedium_MediumBlue_normal(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
