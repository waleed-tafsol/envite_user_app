import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InviteChips extends StatefulWidget {
  const InviteChips({super.key});

  @override
  _InviteChipsState createState() => _InviteChipsState();
}

class _InviteChipsState extends State<InviteChips> {
  int _selectedChipIndex = 0;

  final List<String> _chipLabels = ['Pinned', 'Planned events', 'My events'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 2.w,
        children: List<Widget>.generate(
          _chipLabels.length,
          (int index) {
            return ChoiceChip(
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
