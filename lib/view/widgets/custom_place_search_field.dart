import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/ApiConstant.dart';
import '../../constants/colors_constants.dart';

class CustomPlaceSearchField extends StatefulWidget {
  final Function(String placeName, gmaps.LatLng coordinates) onPlaceSelected;
  final Color? suggestionColor;

  const CustomPlaceSearchField({
    super.key,
    required this.onPlaceSelected,
    this.suggestionColor,
  });

  @override
  State<CustomPlaceSearchField> createState() => _CustomPlaceSearchFieldState();
}

class _CustomPlaceSearchFieldState extends State<CustomPlaceSearchField> {
  final TextEditingController _controller = TextEditingController();
  final FlutterGooglePlacesSdk _placesSdk =
      FlutterGooglePlacesSdk(ApiConstants.googleAPIKey);

  bool _isLoading = false;
  List<AutocompletePrediction> _suggestions = [];

  void _onTextChanged(String value) async {
    setState(() {
      _isLoading = true;
      _suggestions.clear();
    });

    if (value.isEmpty) {
      setState(() {
        _isLoading = false;
        _suggestions = [];
      });
      return;
    }

    try {
      final response = await _placesSdk.findAutocompletePredictions(value);
      setState(() {
        _suggestions = response.predictions.toList();
      });
    } catch (e) {
      print("Prediction error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _onSuggestionTap(AutocompletePrediction place) async {
    try {
      final result = await _placesSdk.fetchPlace(
        place.placeId,
        fields: [PlaceField.Location, PlaceField.Address],
      );

      final location = result.place?.latLng;
      final placeName = place.fullText ?? '';

      if (location != null) {
        FocusScope.of(context).unfocus(); // ✅ Close the keyboard

        setState(() {
          _controller.text = placeName;
          _suggestions.clear(); // ✅ Clear suggestions
        });

        widget.onPlaceSelected(
          placeName,
          gmaps.LatLng(location.lat, location.lng),
        );
      }
    } catch (e) {
      print("Error fetching place details: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          onChanged: _onTextChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.location_on_outlined),
            suffixIcon: _isLoading
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.kBerkeleyBlue,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        _controller.clear();
                        _suggestions.clear();
                      });
                    },
                    child:
                        Icon(Icons.clear, color: Colors.redAccent, size: 4.w),
                  ),
            hintText: "Venue location",
          ),
        ),
        const SizedBox(height: 10),

        // Suggestion list with height constraint
        if (_suggestions.isNotEmpty)
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 30.h),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = _suggestions[index];
                return GestureDetector(
                  onTap: () => _onSuggestionTap(suggestion),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: widget.suggestionColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: AppColors.kIconColor),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Text(
                            suggestion.fullText,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
