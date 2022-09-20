import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/src/ui/pages/card/coin_widget.dart';

class CarrouselImages {
  static List<Widget> carrouselImages = [
    const CoinWidget(title: 'Ouro', subTitle: '30% de retorno', image: AppImages.goldCardImage),
    const CoinWidget(title: 'Prata', subTitle: '60% de retorno', image: AppImages.silverCardImage),
    const CoinWidget(title: 'BitCoin', subTitle: '90% de retorno', image: AppImages.bitcoinCardImage),
  ];
}
