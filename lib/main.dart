import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/api_repository.dart';
import 'router.dart';
import 'presentation/theme.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ApiRepository(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Hotel Booking',
        theme: theme,
      ),
    );
  }
}

// TODO i18
