import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';

class FennecPrimaryButton extends StatelessWidget with Screen {
  final double? width;
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  FennecPrimaryButton({
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
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.onPrimary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: colors.surface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
