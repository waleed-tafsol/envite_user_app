import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberShipChips extends StatefulWidget {
  const MemberShipChips({super.key});

  @override
  State<MemberShipChips> createState() => _MemberShipChipsState();
}

class _MemberShipChipsState extends State<MemberShipChips> {
  int _selectedChipIndex = 0;

  final List<String> _chipLabels = [
    'Packages',
    'Top Up',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          _chipLabels.length * 2 - 1, // Double the length minus one for spacers
          (int index) {
            if (index.isEven) {
              int chipIndex = index ~/ 2;
              return ChoiceChip(
                backgroundColor: AppColors.kBlueMediumShade,
                selectedColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: k5BorderRadius,
                  side: BorderSide(
                    color: AppColors.kBlueMediumShade,
                  ),
                ),
                label: Text(
                  _chipLabels[chipIndex],
                  style: TextStyle(
                    color: _selectedChipIndex == chipIndex
                        ? Colors.white
                        : AppColors.kBluedarkShade,
                  ),
                ),
                selected: _selectedChipIndex == chipIndex,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChipIndex = selected ? chipIndex : _selectedChipIndex;
                  });
                },
              );
            } else {
              return SizedBox(width: 4.w); // A3djust the width for the desired gap
            }
          },
        ),
      ),
    );
  }
}
