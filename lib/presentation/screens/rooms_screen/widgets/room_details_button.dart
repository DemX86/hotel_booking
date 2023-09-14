import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/common.dart';

class RoomDetailsButton extends StatelessWidget {
  final void Function() onTap;

  const RoomDetailsButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    return Material(
      color: lightBlueColor,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(lc.roomDetailsButton, style: Styles.roomDetailsButton),
              const SizedBox(width: 2),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 8,
                ),
                child: Image.asset(
                  'assets/images/arrow_right.png',
                  width: 8,
                  height: 14,
                  color: blueColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
