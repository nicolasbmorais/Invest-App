import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/src/ui/pages/carrousel/carrousel_images.dart';

class CarrouselWidget extends GetResponsiveView {
  CarrouselWidget({this.onTap, Key? key}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  CarrouselImages.carrouselImages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: CarrouselImages.carrouselImages[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
