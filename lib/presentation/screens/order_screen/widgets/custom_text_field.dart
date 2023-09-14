import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/common.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? hint;
  final TextInputType? keyboardType;
  final int length;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.inputFormatters,
    this.hint,
    this.keyboardType,
    this.length = 1,
    this.textCapitalization = TextCapitalization.sentences,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.only(top: 8),
      color: const Color(0xfff6f6f9),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: hint,
            hintStyle: Styles.textFieldHint,
            labelText: label,
            labelStyle: Styles.textFieldLabel,
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          style: Styles.textField,
          textCapitalization: textCapitalization,
          validator: validator ??
              (value) => value!.length < length ? lc.touristFieldError : null,
        ),
      ),
    );
  }
}
