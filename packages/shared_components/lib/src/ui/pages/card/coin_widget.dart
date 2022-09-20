import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               title,
                style: TextStyles.primaryButton,
              ),
              Text(
               subTitle,
                style: TextStyles.bodyText,
              ),
            ],
          ),
        )
      ],
    );
  }
}
