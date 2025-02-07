import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/*final List<Widget> slidersList = [
  Image.asset(slider1),
  Image.asset(slider2),
  Image.asset(slider3),
];*/

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  _HomeCarouselWidgetState createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: [
            // for (var banner in context.read<AuthViewModel>().getBannerList)
            //   CachedNetworkImage(imageUrl: banner.media![0],)
          ],
          carouselController: _controller,
          options: CarouselOptions(
              // height: 200,
              autoPlay: true,
              viewportFraction: 0.85.w,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: context.read<AuthViewModel>().getBannerList.asMap().entries.map((entry) {
      //     return GestureDetector(
      //       onTap: () => _controller.animateToPage(entry.key),
      //       child: Container(
      //         width: 7.0,
      //         height: 7.0,
      //         margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      //         decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: (Theme.of(context).brightness == Brightness.dark
      //                 ? Colors.white
      //                 : AppColors.kPrimaryColor)
      //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
      //       ),
      //     );
      //   }).toList(),
      // ),
    ]);
  }
}
