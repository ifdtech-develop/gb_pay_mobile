import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FennecTextField extends StatelessWidget with Screen {
  final double? height;
  final double? width;
  final String? label;
  final void Function(String? value)? onChanged;
  final String? error;
  final TextInputType? inputType;
  final bool disabled;
  final List<TextInputFormatter>? formatters;
  final bool obscured;
  final bool autofocus;
  final TextEditingController? controller;

  FennecTextField({
    Key? key,
    this.height,
    this.width,
    this.label,
    this.onChanged,
    this.error,
    this.inputType = TextInputType.text,
    this.disabled = false,
    this.obscured = false,
    this.formatters,
    this.autofocus = false,
    this.controller,
  }) : super(key: key) {
    _obscurePassword.value = obscured;
  }

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? media.size.width,
      height: height ?? 64,
      child: ValueListenableBuilder<bool>(
        valueListenable: _obscurePassword,
        builder: (_, _obscurePasswordValue, child) {
          return TextField(
            controller: controller,
            autofocus: autofocus,
            keyboardType: inputType,
            onChanged: onChanged,
            inputFormatters: formatters,
            obscureText: _obscurePasswordValue,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8,
              ).copyWith(bottom: 4),
              errorText: error,
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              label: Text(
                label ?? '',
              ),
              suffixIcon: obscured
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: IconButton(
                        onPressed: () {
                          _obscurePassword.value = !_obscurePasswordValue;
                        },
                        icon: Icon(
                          _obscurePasswordValue
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                      ),
                    )
                  : null,
            ),
            style: const TextStyle(
              fontSize: 24,
            ),
          );
        },
      ),
    );
  }
}
