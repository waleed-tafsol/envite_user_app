import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/TextConstant.dart';
import '../../../constants/colors_constants.dart';
import '../../../controllers/CmsScreenController.dart';
import '../../../shimmer_loaders/event_tile_shimmer.dart';

class CmsScreen extends GetView<CmsScreenController> {
  const CmsScreen({super.key});
  static const routeName = "CmsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isPrivacyPolicy
            ? "Privacy Policy"
            : "Terms And Conditions"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: RefreshIndicator(
          onRefresh: () => controller.fetchCms(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Obx(() {
              return controller.isLoading.value
                  ? Column(
                      children: List.generate(
                        100,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child:
                              sizedShimmer(height: 1.h, width: double.infinity),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.isEng.value ? "English" : "عربي",
                                style: TextConstants.bodymedium_darkBlue_normal(
                                    context),
                              ),
                              Switch(
                                value: controller.isEng.value,
                                onChanged: (value) {
                                  controller.isEng.value = value;
                                },
                                activeColor: AppColors.kBluedarkShade,
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(height: 16),
                        Obx(() {
                          // Fetch the correct CMS content based on type
                          var selectedItem =
                              controller.cmsModel.value?.data?.firstWhere(
                            (item) =>
                                item.cmsType ==
                                (controller.isPrivacyPolicy
                                    ? 'privacy-policy'
                                    : 'terms-and-conditions'),
                          );

                          // Extract the correct language content
                          String content = controller.isEng.value
                              ? selectedItem?.content?.en ?? 'Content not found'
                              : selectedItem?.content?.ar ??
                                  'المحتوى غير موجود';

                          return Html(
                            data: content,
                            style: {
                              "body": Style(
                                fontSize: FontSize.medium,
                                color: Colors.black,
                              ),
                            },
                          );
                        }),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
