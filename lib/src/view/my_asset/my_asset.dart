import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/src/model/demo_data.dart';
import 'package:shared_components/shared_components.dart';

class MyAssetPage extends GetResponsiveView {
  MyAssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        title: Text('Meu ativo', style: TextStyles.titleBold),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close_rounded, color: ColorPalette.grey),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text('Seu portfólio total de ativos', style: TextStyles.bodyTextGrey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 40),
                    child: Row(
                      children: [
                        Text('N203,935', style: TextStyles.titleBold),
                        const Icon(Icons.file_upload_rounded, color: Colors.green, size: 20),
                        const Text('+2%', style: TextStyle(fontSize: 11, color: Colors.green)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Planos atuais', style: TextStyles.titleBold),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CoinWidget(title: 'Bitcoin', subTitle: '90% de retorno', image: AppImages.bigBitcoinImage),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Text('Histórico', style: TextStyles.titleBold),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GuideListTile(
                        title: demoData[0]['title'],
                        titleStyle: TextStyles.titleBold,
                        subTitle: demoData[0]['description'],
                        divider: true,
                        suffixText: demoData[0]['date'],
                      ),
                      GuideListTile(
                        title: demoData[1]['title'],
                        titleStyle: TextStyles.titleGreen,
                        subTitle: demoData[1]['description'],
                        divider: true,
                        suffixText: demoData[1]['date'],
                      ),
                      GuideListTile(
                        title: demoData[2]['title'],
                        titleStyle: TextStyles.titleBold,
                        subTitle: demoData[2]['description'],
                        divider: true,
                        suffixText: demoData[2]['date'],
                      ),
                      GuideListTile(
                        title: demoData[3]['title'],
                        titleStyle: TextStyles.titleGreen,
                        subTitle: demoData[3]['description'],
                        divider: true,
                        suffixText: demoData[3]['date'],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
