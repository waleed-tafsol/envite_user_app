import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/SupportController.dart';
import 'package:event_planner_light/controllers/membership_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class MemberShipChips extends StatelessWidget {
  final MembershipController membershipController = Get.find();

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
          _chipLabels.length * 2 - 1,
          (int index) {
            if (index.isEven) {
              int chipIndex = index ~/ 2;
              return Obx(() {
                return ChoiceChip(
                  backgroundColor: AppColors.kBlueMediumShade,
                  selectedColor: AppColors.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: k5BorderRadius,
                    side: BorderSide(color: AppColors.kBlueMediumShade),
                  ),
                  label: Text(
                    _chipLabels[chipIndex],
                    style: TextStyle(
                      color: membershipController.selectedChipIndex.value ==
                              chipIndex
                          ? Colors.white
                          : AppColors.kBluedarkShade,
                    ),
                  ),
                  selected:
                      membershipController.selectedChipIndex.value == chipIndex,
                  onSelected: (bool selected) {
                    if (selected) {
                      membershipController.updateSelectedChip(chipIndex);
                    }
                  },
                );
              });
            } else {
              return SizedBox(width: 4.w);
            }
          },
        ),
      ),
    );
  }
}

class SupportChip extends GetWidget<Supportcontroller> {
  const SupportChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // spacing: 2.w,
          children: List<Widget>.generate(
            controller.allTypes.length,
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
                    controller.allTypes[index],
                    style: TextStyle(
                        color: controller.selectedType.value ==
                                controller.allTypes[index]
                            ? Colors.white
                            : AppColors.kBluedarkShade),
                  ),
                  selected: controller.selectedType.value ==
                      controller.allTypes[index],
                  onSelected: (bool selected) {
                    controller.selectedType.value = controller.allTypes[index];
                    controller.getAllTickets();
                  },
                ),
              );
            },
          ).toList(),
        );
      }),
    );
  }
}
