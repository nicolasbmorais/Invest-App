import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GuideListTile extends StatelessWidget {
  const GuideListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.divider,
    this.titleStyle,
    this.suffixImage,
    this.hasImage = false,
    this.suffixText,
    this.dividerColor,
    this.suffixTextColor,
    this.subtitleTextColor,
  });
  final String title;
  final String subTitle;
  final String? suffixText;
  final Widget? suffixImage;
  final TextStyle? titleStyle;
  final bool divider;
  final bool hasImage;
  final Color? dividerColor;
  final TextStyle? suffixTextColor;
  final TextStyle? subtitleTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 72.0),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        title,
                        style: titleStyle ?? TextStyles.bodyRegular,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: subtitleTextColor ?? TextStyles.bodySmallGrey179,
                    ),
                  ],
                ),
              ),
              hasImage
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                        child: suffixImage,
                      ),
                    )
                  : Text(suffixText ?? "", style: suffixTextColor ?? TextStyles.bodySmallGrey179),
            ],
          ),
          divider
              ? Divider(
                  color: dividerColor ?? ColorPalette.grey179,
                  thickness: 1,
                )
              : Container(),
        ],
      ),
    );
  }
}
