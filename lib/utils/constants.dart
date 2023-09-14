import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String dateFormat = 'dd/VV/yyyy';
const touristCountLimit = 10;

const locale = Locale('ru');

Map<int, String> getCountMasculineAdjectives() {
  Map<int, String>? result;
  AppLocalizations.delegate.load(locale).then(
    (lc) {
      result = {
        1: lc.first,
        2: lc.second,
        3: lc.third,
        4: lc.fourth,
        5: lc.fifth,
        6: lc.sixth,
        7: lc.seventh,
        8: lc.eighth,
        9: lc.ninth,
        10: lc.tenth,
      };
    },
  );
  return result!;
}
