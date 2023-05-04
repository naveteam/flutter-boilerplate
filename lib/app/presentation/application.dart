import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/navigation.dart';
import 'package:flutter_boilerplate/app/presentation/theme/theme.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/builders.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: Navigation.config,
      builder: (context, child) => SystemOverlayBuilder(builder: (context) => child!),
    );
  }
}
