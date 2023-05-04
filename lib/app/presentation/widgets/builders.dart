import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/app/presentation/theme/colors.dart';
import 'package:flutter_boilerplate/app/utils/extensions.dart';
import 'package:provider/provider.dart';

class SystemOverlayBuilder extends StatefulWidget {
  final WidgetBuilder builder;

  const SystemOverlayBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<SystemOverlayBuilder> createState() => _SystemOverlayBuilderState();
}

class _SystemOverlayBuilderState extends State<SystemOverlayBuilder> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) => widget.builder(context);

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _handle();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _handle();
  }

  void _handle() {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final surfaceColor = brightness.isDarkModeEnabled ? DarkColors.surface : LightColors.surface;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: brightness.inverse,
        systemNavigationBarColor: surfaceColor,
      ),
    );
  }
}

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
