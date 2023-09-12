import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/api_repository.dart';
import '../../../domain/models/models.dart';
import '../../../utils/constants.dart';
import '../../common/common.dart';
import 'widgets/room_details_button.dart';

class RoomsScreen extends StatefulWidget {
  final String hotelName;

  const RoomsScreen({
    super.key,
    required this.hotelName,
  });

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late Future<List<RoomModel>> Function() _loadRoomsFutureFactory;

  @override
  void initState() {
    _loadRoomsFutureFactory =
        () => RepositoryProvider.of<ApiRepository>(context).loadRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: widget.hotelName),
      body: CommonFutureBuilder(
        futureFactory: _loadRoomsFutureFactory,
        builder: (context, rooms) {
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration.zero,
                () => setState(() {}),
              );
            },
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return SectionPlate(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Carousel(imageUrls: room.imageUrls),
                      Text(room.name, style: Styles.title),
                      Peculiarities(room.peculiarities),
                      RoomDetailsButton(onTap: () {}),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${numberFormat.format(room.price.round())} ₽',
                            style: Styles.price,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(
                                room.priceFor.toLowerCase(),
                                style: Styles.bodyGrey,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ActionButton(
                        title: 'Выбрать номер',
                        onTap: () => context.push('/booking'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
