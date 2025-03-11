import 'package:app/ui/core/shared/base_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends BaseButton {
  PrimaryButton({
    super.key,
    super.onPressed,
    super.text,
    super.onLongPress,
    super.width,
    super.height,
    super.loading = false,
    super.disabled = false,
    super.rounded = false,
  }) : super(
          backgroundColor: const Color.fromARGB(255, 113, 112, 176),
          textColor: Colors.white,
          disabledBackgroundColor:
              Color.fromARGB(255, 113, 112, 176).withAlpha(160),
          disabledTextColor: Colors.white.withAlpha(160),
        );
}
