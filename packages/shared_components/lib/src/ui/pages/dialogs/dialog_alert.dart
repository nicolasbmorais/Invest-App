import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomAlert {
  CustomAlert._();

  static void show({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.error),
      duration: const Duration(seconds: 4),
      backgroundColor: const Color.fromARGB(255, 236, 231, 231),
    );
  }

  static void showGenericError() {
    show(
      title: 'Erro',
      message: 'Um erro inesperado aconteceu.',
    );
  }
}
