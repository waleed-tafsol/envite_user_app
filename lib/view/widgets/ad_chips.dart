import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdChips extends StatefulWidget {
  const AdChips({super.key});

  @override
  State<AdChips> createState() => _AdChipsState();
}

class _AdChipsState extends State<AdChips> {
  int _selectedChipIndex = 0;

  final List<String> _chipLabels = [
    'Approved',
    'Pending',
    'Past Posted',
    'Rejected'
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // spacing: 2.w,
        children: List<Widget>.generate(
          _chipLabels.length,
          (int index) {
            return Expanded(
              child: ChoiceChip(
                backgroundColor: AppColors.kBlueMediumShade,
                selectedColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: k5BorderRadius,
                    side: BorderSide(
                      color: AppColors.kBlueMediumShade,
                    )),
                label: Text(
                  _chipLabels[index],
                  style: TextStyle(
                      color: _selectedChipIndex == index
                          ? Colors.white
                          : AppColors.kBluedarkShade),
                ),
                selected: _selectedChipIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChipIndex = selected ? index : _selectedChipIndex;
                  });
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class CatagoryFilterCips extends StatefulWidget {
  const CatagoryFilterCips({super.key});

  @override
  _CatagoryFilterCipsState createState() => _CatagoryFilterCipsState();
}

class _CatagoryFilterCipsState extends State<CatagoryFilterCips> {
  int _selectedChipIndex = 0;

  final List<String> _chipLabels = ['Gala', 'Conference', 'Party', 'Wedding'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        _chipLabels.length,
        (int index) {
          return ChoiceChip(
            label: Text(
              _chipLabels[index],
            ),
            selected: _selectedChipIndex == index,
            onSelected: (bool selected) {
              setState(() {
                _selectedChipIndex = selected ? index : _selectedChipIndex;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

class ByStatusFilterCips extends StatefulWidget {
  const ByStatusFilterCips({super.key});

  @override
  ByStatusFilterCipsState createState() => ByStatusFilterCipsState();
}

class ByStatusFilterCipsState extends State<ByStatusFilterCips> {
  int _selectedChipIndex = 0;

  final List<String> _chipLabels = ['Public', 'Exclusif'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        _chipLabels.length,
        (int index) {
          return ChoiceChip(
            label: Text(
              _chipLabels[index],
            ),
            selected: _selectedChipIndex == index,
            onSelected: (bool selected) {
              setState(() {
                _selectedChipIndex = selected ? index : _selectedChipIndex;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

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
