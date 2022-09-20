import 'package:common/common.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  final bool disabled;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? pressedColor;
  final Color? hoverColor;

  const PrimaryButton(
      {required this.label,
      required this.onPressed,
      this.loading = false,
      this.disabled = false,
      this.backgroundColor,
      this.disabledColor,
      this.pressedColor,
      this.hoverColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !disabled && !loading ? onPressed : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16.0)),
        backgroundColor: MaterialStateProperty.all(ColorPalette.primaryButton),
      ),
      child: Container(
        height: 48.0,
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyles.primaryButton,
        ),
        // loading    // ? PrimaryLoading(color: ColorPalette.primaryButton) :
      ),
    );
  }
}
