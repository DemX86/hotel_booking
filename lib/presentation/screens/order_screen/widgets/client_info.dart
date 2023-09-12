import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../common/common.dart';
import '../../../cubits/order_cubit.dart';
import 'custom_text_field.dart';

class ClientInfo extends StatefulWidget {
  final GlobalKey<FormState> phoneNumberFormKey;
  final GlobalKey<FormState> emailFormKey;
  const ClientInfo({
    super.key,
    required this.phoneNumberFormKey,
    required this.emailFormKey,
  });

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  final _phoneNumberMask = MaskTextInputFormatter(
    mask: '+7 ### ### ##-##',
    type: MaskAutoCompletionType.eager,
  );
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SectionPlate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Информация о покупателе', style: Styles.title),
          const SizedBox(height: 12),
          Form(
            key: widget.phoneNumberFormKey,
            child: Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus &&
                    widget.phoneNumberFormKey.currentState!.validate()) {
                  context
                      .read<OrderCubit>()
                      .setClientPhoneNumber(_phoneNumberMask.getUnmaskedText());
                }
              },
              child: CustomTextField(
                inputFormatters: [_phoneNumberMask],
                hint: '+7 *** *** **-**',
                keyboardType: TextInputType.phone,
                label: 'Номер телефона',
                length: 16,
              ),
            ),
          ),
          Form(
            key: widget.emailFormKey,
            child: Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus && widget.emailFormKey.currentState!.validate()) {
                  context
                      .read<OrderCubit>()
                      .setClientEmail(_emailController.text.trim());
                }
              },
              child: CustomTextField(
                controller: _emailController,
                hint: 'mail@example.com',
                keyboardType: TextInputType.emailAddress,
                label: 'Почта',
                textCapitalization: TextCapitalization.none,
                validator: (value) {
                  return !EmailValidator.validate(value!)
                      ? 'Почта не похожа на настоящую'
                      : null;
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
            style: Styles.formHelper,
          )
        ],
      ),
    );
  }
}
