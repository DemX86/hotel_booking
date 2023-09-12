import 'package:go_router/go_router.dart';

import 'presentation/screens/order_screen/order_screen.dart';
import 'presentation/screens/hotel_screen/hotel_screen.dart';
import 'presentation/screens/paid_screen/paid_screen.dart';
import 'presentation/screens/rooms_screen/rooms_screen.dart';

final router = GoRouter(
  initialLocation: '/hotel',
  routes: [
    GoRoute(
      path: '/hotel',
      builder: (_, __) => const HotelScreen(),
    ),
    GoRoute(
      path: '/rooms',
      builder: (_, state) => RoomsScreen(hotelName: state.extra as String),
    ),
    GoRoute(
      path: '/booking',
      builder: (_, __) => const OrderScreen(),
    ),
    GoRoute(
      path: '/paid',
      builder: (_, __) => const PaidScreen(),
    ),
  ],
);
