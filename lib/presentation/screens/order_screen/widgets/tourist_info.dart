import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../common/common.dart';
import 'custom_text_field.dart';

class TouristInfo extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final bool isRemovable;
  final void Function() onRemoveTap;
  const TouristInfo({
    super.key,
    required this.title,
    this.isExpanded = true,
    this.isRemovable = true,
    required this.onRemoveTap,
  });

  @override
  State<TouristInfo> createState() => _TouristInfoState();
}

class _TouristInfoState extends State<TouristInfo> {
  late bool _isExpanded;
  late TextEditingController _firstNameController;
  late TextEditingController _secondNameController;
  late TextEditingController _birthdateController;
  late TextEditingController _nationalityController;
  late TextEditingController _intlPassportIdController;
  late TextEditingController _intlPassportValidUntilController;
  final _birthdateMask = MaskTextInputFormatter(
    mask: '##.##.####',
    type: MaskAutoCompletionType.eager,
  );
  final _intlPassportIdMask = MaskTextInputFormatter(
    mask: '## #######',
    type: MaskAutoCompletionType.eager,
  );
  final _intlPassportValidUntilMask = MaskTextInputFormatter(
    mask: '##.##.####',
    type: MaskAutoCompletionType.eager,
  );

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    _firstNameController = TextEditingController();
    _secondNameController = TextEditingController();
    _birthdateController = TextEditingController();
    _nationalityController = TextEditingController();
    _intlPassportIdController = TextEditingController();
    _intlPassportValidUntilController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _birthdateController.dispose();
    _nationalityController.dispose();
    _intlPassportIdController.dispose();
    _intlPassportValidUntilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionPlate(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubicEmphasized,
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.title, style: Styles.title),
                const Spacer(),
                if (_isExpanded && widget.isRemovable) _removeButton(),
                _expandButton(),
              ],
            ),
            Visibility(
              maintainState: true,
              visible: _isExpanded,
              child: Column(
                children: [
                  const SizedBox(height: 9),
                  CustomTextField(
                    controller: _firstNameController,
                    label: 'Имя',
                  ),
                  CustomTextField(
                    controller: _secondNameController,
                    label: 'Фамилия',
                  ),
                  CustomTextField(
                    controller: _birthdateController,
                    hint: 'DD.MM.YYYY',
                    inputFormatters: [_birthdateMask],
                    keyboardType: TextInputType.number,
                    label: 'Дата рождения',
                    length: 10,
                  ),
                  CustomTextField(
                    controller: _nationalityController,
                    label: 'Гражданство',
                  ),
                  CustomTextField(
                    controller: _intlPassportIdController,
                    inputFormatters: [_intlPassportIdMask],
                    keyboardType: TextInputType.number,
                    label: 'Номер загранпаспорта',
                    length: 10,
                  ),
                  CustomTextField(
                    controller: _intlPassportValidUntilController,
                    hint: 'DD.MM.YYYY',
                    inputFormatters: [_intlPassportValidUntilMask],
                    keyboardType: TextInputType.number,
                    label: 'Срок действия загранпаспорта',
                    length: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _removeButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: () async {
            final isConfirmed = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Удалить туриста?'),
                  content: const Text('Отменить это действие будет невозможно'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text(
                        'Отмена',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text(
                        'Удалить',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                );
              },
            );
            if (isConfirmed != null && isConfirmed) {
              widget.onRemoveTap();
            }
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              'assets/images/remove.png',
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _expandButton() {
    return Material(
      color: lightBlueColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
          child: Image.asset(
            _isExpanded
                ? 'assets/images/arrow_up.png'
                : 'assets/images/arrow_down.png',
            width: 14,
            height: 8,
          ),
        ),
      ),
    );
  }
}
