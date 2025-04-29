import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/model/AdsModel.dart';
import 'package:event_planner_light/utills/string_decoration.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import '../../constants/ApiConstant.dart';
import '../../controllers/Auth_services.dart';
import '../../utills/CustomSnackbar.dart';
import 'TagContainer.dart';

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
  bool _isLoading = false;
  List<AdsModel> ads = [];

  @override
  void initState() {
    // TODO: implement initState

    getAllTickets();

    super.initState();
  }

  Future<void> getAllTickets() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getAlldds), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Ensure jsonResponse['data'] is a List of Maps
        List<Map<String, dynamic>> jsonResponseData =
            List<Map<String, dynamic>>.from(jsonResponse['data']);

        ads.clear();
        ads.addAll(jsonResponseData.map((e) => AdsModel.fromJson(e)).toList());
      } else {
        throw Exception('Failed to load Tickets');
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
    return CarouselSlider(
      items: [
        for (var ad in ads)
          Container(
              decoration: BoxDecoration(
              /*    image: DecorationImage(
                    image: NetworkImage( ad.image ?? "",),
                    fit: BoxFit.contain,
                  ),*/
                  color: AppColors.kBerkeleyBlue,
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              // height: 20.h,
              child: Center(
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          ad.image == null
                              ? SizedBox()
                              : CachedNetworkImage(
                                  imageUrl: ad.image ?? "",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  cacheKey: ad.image,
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Colors.white,
                                  ),
                                ),
                          Positioned(
                            left: 2.h,
                            bottom: 2.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  capitalizeFirstLetter(ad.name ?? ""),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                ad.tags == null
                                    ? SizedBox()
                                    : Wrap(
                                        spacing: 1.w,
                                        runSpacing: 1.h,
                                        children: ad.tags!.map((element) {
                                          return TagsContainer(
                                            tag: element,
                                          );
                                        }).toList(),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ))
      ],
      carouselController: _controller,
      options: CarouselOptions(
          autoPlayInterval: Duration(seconds: 10),
          // height: 200,
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: true,
          // aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
    );
  }
}
