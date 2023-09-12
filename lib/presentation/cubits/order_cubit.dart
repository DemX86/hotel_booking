import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/models.dart';
import '../../utils/constants.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  void setClientPhoneNumber(String clientPhoneNumberRaw) {
    final clientPhoneNumber = int.parse(clientPhoneNumberRaw);
    emit(state.copyWith(clientPhoneNumber: clientPhoneNumber));
  }

  void setClientEmail(String clientEmail) {
    emit(state.copyWith(clientEmail: clientEmail));
  }

  void addTourist() {
    if (state.touristCount + 1 > touristCountLimit) {
      emit(state.copyWith(
        tourists: [...state.tourists],
        touristCountExceeded: true,
      ));
    } else {
      final newTourist = Tourist();
      emit(state.copyWith(
        tourists: [...state.tourists, newTourist],
      ));
    }
  }

  void removeTourist(Tourist touristToRemove) {
    if (state.touristCount == 1) return;
    emit(
      state.copyWith(
          tourists: state.tourists
              .where((tourist) => tourist.id != touristToRemove.id)
              .toList()),
    );
  }
}
