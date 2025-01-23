import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/my_event_controller.dart';
import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyEventController controller = Get.put(MyEventController());
    return Scaffold(
      
      body: PopScope(
        canPop: false,
        child: SafeArea(child: 
        SingleChildScrollView(child: Column(children: [
                
                  
                     Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(() {
                    return controller.isEventLoading.value
                        ? ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children:
                                List.generate(5, (index) => eventTileShimmer()),
                          )
                        : controller.myEvents.isEmpty
                            ? SizedBox(
                                height: 40.h,
                                child: Center(
                                  child: Text(
                                    "No Suggestions are available",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColors.kTextBlack),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.myEvents.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return EventTileWidget(
                                   images: "",
                                  address: controller.myEvents[index].address,
                                  eventType: controller.myEvents[index].eventType,
                                  );
                                });
                  }),
                ),],),))),
    );
  }
  imageUrl(image){
if(image==null){
return null;
}else{
  return image;
}
  }
}