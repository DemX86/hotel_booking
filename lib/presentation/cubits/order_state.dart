import '../../domain/models/models.dart';

class OrderState {
  final int? clientPhoneNumber;
  final String? clientEmail;
  final List<Tourist> tourists;
  final bool touristCountExceeded;

  OrderState({
    this.clientPhoneNumber,
    this.clientEmail,
    List<Tourist>? tourists,
    this.touristCountExceeded = false,
  }) : tourists = tourists ?? [Tourist()];

  int get touristCount => tourists.length;

  OrderState copyWith({
    int? clientPhoneNumber,
    String? clientEmail,
    List<Tourist>? tourists,
    bool? touristCountExceeded,
  }) {
    return OrderState(
      clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
      clientEmail: clientEmail ?? this.clientEmail,
      tourists: tourists ?? this.tourists,
      touristCountExceeded: touristCountExceeded ?? this.touristCountExceeded,
    );
  }
}
