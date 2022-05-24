import 'package:flutter/material.dart';

Future<T?> customBottomSheet<T>({
  required BuildContext context,
  required Widget body,
  double padding = 24,
  bool isDismissible = true,
  bool enableDrag = true,
}) =>
    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      builder: (context) => FractionallySizedBox(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (enableDrag)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  height: 4,
                  width: 35,
                ),
              const SizedBox(height: 24),
              body,
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
