import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  final bool disabled;
  final Color? textColor;

  const SecondaryButton({
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !disabled && !loading ? onPressed : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: ColorPalette.transparent),
        )),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(ColorPalette.transparent),
      ),
      child: Container(
        height: 48.0,
        alignment: Alignment.center,
        child: Text(label, textAlign: TextAlign.center, style: TextStyles.secondaryButton),
      ),
      //  loading  ? PrimaryLoading(color: textColor ?? ColorPalette.typographyInteractivePrimaryTealConsistent) :
    );
  }
}
