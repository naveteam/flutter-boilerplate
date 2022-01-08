import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/authentication_form.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/authentication/authentication_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const AuthenticationScreen(),
      );

  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isPasswordVisible = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Provider.of<AuthenticationViewModel>(
                context,
                listen: false,
              ).authenticate(
                credential: email.text,
                password: password.text,
              );
            }
          },
          child: const Text('Submit'),
        )
      ],
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(16),
          children: [
            AuthenticationForm(
              formKey: formKey,
              email: email,
              password: password,
              isPasswordVisible: isPasswordVisible,
              onChangePasswordVisibility: () => setState(() {
                isPasswordVisible = !isPasswordVisible;
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in [email, password]) {
      controller.dispose();
    }
  }
}
