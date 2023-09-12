import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/api_repository.dart';
import '../../../domain/models/models.dart';
import '../../../utils/constants.dart';
import '../../common/common.dart';
import '../../cubits/order_cubit.dart';
import '../../cubits/order_state.dart';
import 'widgets/add_tourist_section.dart';
import 'widgets/client_info.dart';
import 'widgets/price_details.dart';
import 'widgets/tour_details.dart';
import 'widgets/tourist_info.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future<OrderModel> Function() _loadOrderFutureFactory;
  final OrderCubit orderCubit = OrderCubit();
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loadOrderFutureFactory =
        () => RepositoryProvider.of<ApiRepository>(context).loadOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Бронирование'),
      body: BlocProvider(
        create: (_) => OrderCubit(),
        child: CommonFutureBuilder(
          futureFactory: _loadOrderFutureFactory,
          builder: (_, order) => _content(order),
        ),
      ),
    );
  }

  Widget _content(OrderModel order) {
    final totalPrice = order.tourPrice + order.fuelCharge + order.serviceCharge;
    return BlocConsumer<OrderCubit, OrderState>(
      bloc: orderCubit,
      listener: (context, state) {
        if (state.touristCountExceeded) {
          const snackBar = SnackBar(
            content: Text('Можно добавить не больше десяти туристов'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SectionPlate(
                      child: HotelHeader(
                        hotelRating: order.hotelRating,
                        hotelRatingName: order.hotelRatingName,
                        hotelName: order.hotelName,
                        hotelAddress: order.hotelAddress,
                        onAddressTap: () {},
                      ),
                    ),
                    TourDetails(order: order),
                    ClientInfo(
                      phoneNumberFormKey: _phoneNumberFormKey,
                      emailFormKey: _emailFormKey,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: _tourists(orderCubit: orderCubit),
                      ),
                    ),
                    AddTouristSection(onTap: () => orderCubit.addTourist()),
                    PriceDetails(
                      order: order,
                      totalPrice: totalPrice,
                    ),
                  ],
                ),
              ),
            ),
            BottomPlate(
              child: ActionButton(
                title: 'Оплатить ${numberFormat.format(totalPrice.round())} ₽',
                onTap: () {
                  final formStatuses = [
                    _formKey.currentState!.validate(),
                    _phoneNumberFormKey.currentState!.validate(),
                    _emailFormKey.currentState!.validate(),
                  ];
                  if (formStatuses.every((item) => item)) {
                    context.push('/paid');
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }

  List<Widget> _tourists({required OrderCubit orderCubit}) {
    final tourists = orderCubit.state.tourists;
    return tourists.asMap().entries.map((entry) {
      final index = entry.key;
      final tourist = entry.value;
      return TouristInfo(
        key: ValueKey(tourist.id),
        title: '${countMasculineAdjectives[index + 1]} турист',
        isRemovable: index != 0,
        onRemoveTap: () => orderCubit.removeTourist(tourist),
      );
    }).toList();
  }
}
