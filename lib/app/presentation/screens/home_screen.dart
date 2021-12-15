import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodel/authentication/authentication_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: <Widget>[
                SliverFillRemaining(
                  child: Center(
                    child: TextButton(
                      onPressed: () => Provider.of<AuthenticationViewModel>(
                        context,
                        listen: false,
                      ).unAuthenticate(),
                      child: const Text('UnAuthenticate'),
                    ),
                  ),
                )
              ]),
        ),
      );
}
