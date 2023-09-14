import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common.dart';

class CommonFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() futureFactory;
  final Widget Function(BuildContext context, T data) builder;

  const CommonFutureBuilder({
    super.key,
    required this.futureFactory,
    required this.builder,
  });

  @override
  State<CommonFutureBuilder<T>> createState() => _CommonFutureBuilderState<T>();
}

class _CommonFutureBuilderState<T> extends State<CommonFutureBuilder<T>> {
  late Future<T> _future;

  @override
  void initState() {
    _future = widget.futureFactory();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonFutureBuilder<T> oldWidget) {
    _future = widget.futureFactory();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const LinearProgressIndicator();
        }
        if (snapshot.hasError) {
          debugPrint('Loading error: ${snapshot.error}');
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: greyColor,
                  size: 48,
                ),
                const SizedBox(height: 8),
                Text(
                  lc.futureLoadingError,
                  style: Styles.formHelper,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _future = widget.futureFactory();
                    });
                  },
                  child: Text(lc.futureReload),
                ),
              ],
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text('No data received from the API', style: Styles.error),
          );
        }
        final data = snapshot.data as T;
        return widget.builder(context, data);
      },
    );
  }
}
