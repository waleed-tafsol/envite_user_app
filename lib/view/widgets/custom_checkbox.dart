import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;

  const CustomCheckbox({super.key, this.isChecked = false});

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        // padding: EdgeInsets.all(6),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isChecked ? Color(0xff457B9D) : Colors.grey,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                color: Colors.white, // Color of the checkmark
                size: 20,
              )
            : null,
      ),
    );
  }
}
