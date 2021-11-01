import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayBuilder extends StatelessWidget {
  const SystemUiOverlayBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) {
          final Brightness brightness =
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark;

          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarIconBrightness: brightness,
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
              systemNavigationBarIconBrightness: brightness,
            ),
          );
          return builder(context);
        },
      );
}
