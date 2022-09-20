import 'package:common/common.dart';
import 'package:flutter/material.dart';

class InvestAppInput extends TextFormField {
  InvestAppInput({
    Key? key,
    required String text,
    TextInputType? keyboardType,
    TextEditingController? controller,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) : super(
          key: key,
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: Colors.black,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: text,
              labelStyle: const TextStyle(color: ColorPalette.grey179),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette.grey179),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              )
              // focusedErrorBorder: const UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: ColorPalette.secondary,
              //     width: 2,
              //   ),
              // ),

              ),
        );
}
