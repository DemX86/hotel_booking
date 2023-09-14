import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final lc = AppLocalizations.of(context)!;
    return SectionPlate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lc.tourClientInfo, style: Styles.title),
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
                label: lc.tourClientPhoneNumber,
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
                label: lc.tourClientEmail,
                textCapitalization: TextCapitalization.none,
                validator: (value) {
                  return !EmailValidator.validate(value!)
                      ? lc.tourCLientEmailError
                      : null;
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(lc.tourClientInfoPrivacy, style: Styles.formHelper)
        ],
      ),
    );
  }
}
