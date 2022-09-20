import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends GetResponsiveView {
  ProfileListTile({
    required this.icon,
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);
  
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: ColorPalette.white,
            border: Border.all(color: ColorPalette.grey179),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 1),
                blurStyle: BlurStyle.inner,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, size: 25),
                const SizedBox(width: 30),
                Expanded(child: Text(title, style: TextStyles.bodyRegularBlack, overflow: TextOverflow.clip)),
                const Icon(Icons.keyboard_arrow_right, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
