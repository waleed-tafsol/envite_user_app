import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BulletPoints extends StatelessWidget {
  final List<String> items;

  const BulletPoints({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '• ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.kBerkeleyBlue), // Adjust size as needed
            ),
            Expanded(
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.kBerkeleyBlue), // Customize text style
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
