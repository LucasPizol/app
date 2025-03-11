import 'package:app/ui/core/shared/base_button.dart';
import 'package:flutter/material.dart';

class FlatButton extends BaseButton {
  FlatButton({
    super.key,
    super.onPressed,
    super.text,
    super.onLongPress,
    super.width,
    super.height,
    super.loading = false,
    super.disabled = false,
    super.rightIcon,
    super.leftIcon,
  }) : super(
            rounded: false,
            backgroundColor: Colors.transparent,
            textColor: const Color.fromARGB(255, 78, 71, 71),
            disabledBackgroundColor: Colors.transparent,
            elevation: 0,
            disabledTextColor:
                const Color.fromARGB(255, 78, 71, 71).withAlpha(160));
}
