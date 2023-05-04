import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/app/presentation/screens/todos.dart';

abstract class Navigation {
  static GlobalKey<NavigatorState> get rootNavigatorKey => GlobalKey<NavigatorState>();

  static GoRouter get config {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: [
        TodosScreen.route,
      ],
    );
  }
}
