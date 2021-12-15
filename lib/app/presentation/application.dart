import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/builders/system_ui_overlay_builder.dart';
import 'package:flutter_boilerplate/app/presentation/screens/authentication_screen.dart';
import 'package:flutter_boilerplate/app/presentation/screens/home_screen.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodel/authentication/authentication_state.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodel/authentication/authentication_viewmodel.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: SystemUiOverlayBuilder(
          builder: (context) => Consumer<AuthenticationViewModel>(
            builder: (context, viewModel, widget) =>
                viewModel.uiState is UnAuthenticatedState
                    ? const AuthenticationScreen()
                    : const HomeScreen(),
          ),
        ),
      );
}
