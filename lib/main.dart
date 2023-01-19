import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/di/application_container.dart';
import 'package:flutter_boilerplate/app/presentation/application.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationViewModel>(
          create: (context) => ApplicationContainer.authenticationViewModel,
        ),
      ],
      child: const Application(),
    ),
  );
}
