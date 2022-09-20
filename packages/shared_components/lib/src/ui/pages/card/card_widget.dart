import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CardWidget extends GetResponsiveView {
  CardWidget({required this.title, required this.textValue, required this.textButton, Key? key}) : super(key: key);

  final String title;
  final String textValue;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 318,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: ColorPalette.primaryButton,
        boxShadow: [
          BoxShadow(
            color: ColorPalette.primaryButton.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(title, style: TextStyles.bodyText),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                textValue,
                style: TextStyles.titleWhite,
              ),
              SizedBox(
                width: 125,
                height: 40,
                child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: ColorPalette.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: Text(
                      textButton,
                      style: TextStyles.tertiaryButton,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
