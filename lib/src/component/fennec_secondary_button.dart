import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';

class FennecSecondaryButton extends StatelessWidget with Screen {
  final double? width;
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  FennecSecondaryButton({
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.width,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width ?? media.size.width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: colors.onPrimary,
            width: 2,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: disabled ? null : onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: colors.onPrimary,
          ),
        ),
      ),
    );
  }
}
