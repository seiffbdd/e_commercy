import 'package:e_commercy/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    required this.text,
    this.color,
    this.textStyle = Styles.textStyle18,
  });
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text, style: textStyle),
      backgroundColor: color,
    );
  }
}
