import 'package:common/common.dart';
import 'package:flutter/material.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    super.key,
    required this.title,
    required this.suffixText,
  });
  final String title;
  final String suffixText;
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
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
                          style: TextStyles.bodyRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50, child: Text(suffixText, style: TextStyles.bodySmallGrey179)),
              ],
            ),
            const Divider(
              color: ColorPalette.grey179,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
