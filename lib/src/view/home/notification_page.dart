import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class NotificationPage extends GetResponsiveView {
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notificações', style: TextStyles.title),
            const SizedBox(height: 40),
            const NotificationListTile(title: 'As ações da Apple só aumentaram. Verifique isso agora.', suffixText: '15min atrás'),
            const NotificationListTile(title: 'Confira o melhor investidor de hoje. Você vai aprender com ele.', suffixText: '3min atrás'),
            const NotificationListTile(title: 'Onde você se vê nas próximas eras.', suffixText: '1d atrás'),
          ],
        ),
      ),
    );
  }
}
