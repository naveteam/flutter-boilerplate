import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/di/application_container.dart';
import 'package:flutter_boilerplate/app/presentation/application.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodel/authentication/authentication_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationViewModel>(
            create: (context) => ApplicationContainer.authenticationViewModel,
          ),
        ],
        child: const Application(),
      ),
    );
