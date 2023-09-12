import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/api_repository.dart';
import '../../../domain/models/models.dart';
import '../../common/common.dart';
import 'widgets/about.dart';
import 'widgets/face.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late Future<HotelModel> Function() _loadHotelFutureFactory;

  @override
  void initState() {
    _loadHotelFutureFactory =
        () => RepositoryProvider.of<ApiRepository>(context).loadHotel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Отель'),
      body: CommonFutureBuilder(
        futureFactory: _loadHotelFutureFactory,
        builder: (context, hotel) {
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration.zero,
                      () => setState(() {}),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Face(hotel),
                        About(hotel),
                      ],
                    ),
                  ),
                ),
              ),
              BottomPlate(
                child: ActionButton(
                  title: 'К выбору номера',
                  onTap: () => context.push('/rooms', extra: hotel.name),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
