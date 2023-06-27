import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelBuilder<T extends ChangeNotifier> extends StatelessWidget {
  final T Function(BuildContext) create;
  final Widget Function(BuildContext, T, Widget?) builder;

  final Widget? child;

  const ViewModelBuilder({
    Key? key,
    required this.create,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: child,
      builder: (context, child) => Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}
