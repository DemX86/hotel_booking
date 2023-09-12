import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../utils/constants.dart';

const uuid = Uuid();

class Tourist {
  final String id;
  late final String firstName;
  late final String secondName;
  late final String nationality;

  Tourist() : id = uuid.v4();

  set birthdate(value) {
    birthdate = DateFormat(dateFormat).parse(value);
  }

  set intlPassportId(value) {
    intlPassportId = int.parse(value.replaceAll(' ', ''));
  }

  set intlPassportValidUntil(value) {
    intlPassportValidUntil = DateFormat(dateFormat).parse(value);
  }
}
