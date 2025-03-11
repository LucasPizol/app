import 'package:app/ui/core/shared/base_button.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends BaseButton {
  SecondaryButton({
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
          backgroundColor: Colors.white,
          textColor: const Color.fromARGB(255, 113, 112, 176),
          disabledBackgroundColor: Colors.white.withAlpha(160),
          disabledTextColor: Color.fromARGB(255, 113, 112, 176).withAlpha(160),
          hasBorder: true,
        );
}
