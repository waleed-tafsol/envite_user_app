import 'package:flutter/material.dart';


class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    this.status,
  });

  final String? status;

  MaterialColor getColors(String? status) {
    switch (status) {
      case "approved":
        return Colors.green;
      case "completed":
        return Colors.green;
      case "pending":
        return Colors.orange;
      case "rejected":
        return Colors.red;
      case "resolved":
        return Colors.green;
      case "cancel":
        return Colors.red;
      default:
        return Colors.cyan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: getColors(status), borderRadius: BorderRadius.circular(5)),
      child: Text(
        status?.toUpperCase() ?? "",
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
