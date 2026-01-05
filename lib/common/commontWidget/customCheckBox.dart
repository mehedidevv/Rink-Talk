import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color checkedColor;

  const CustomCheckbox({
    Key? key,
    this.initialValue = false,
    this.onChanged,
    this.checkedColor = const Color(0xFF8C8C8C),
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged?.call(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isChecked ? Color(0xFF8C8C8C) : const Color(0xFF8C8C8C);

    return GestureDetector(
      onTap: toggleCheck,
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: borderColor,
            width: 0.50,
          ),
          color: isChecked ? widget.checkedColor : Colors.white,
        ),
        child: isChecked
            ? const Icon(
          Icons.check,
          color: Colors.white,
          size: 18,
        )
            : null,
      ),
    );
  }
}