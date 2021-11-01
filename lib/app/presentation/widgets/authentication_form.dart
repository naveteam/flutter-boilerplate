import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/presentation/utils/validators.dart';

class AuthenticationForm extends StatelessWidget {
  const AuthenticationForm({
    Key? key,
    this.formKey,
    this.isPasswordVisible = false,
    required this.email,
    required this.password,
    required this.onChangePasswordVisibility,
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final bool isPasswordVisible;
  final TextEditingController email;
  final TextEditingController password;
  final VoidCallback onChangePasswordVisibility;

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                label: Text('E-mail'),
                icon: Icon(Icons.email_rounded),
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value.isEmail("It should be a valid e-mail"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                label: const Text('Password'),
                icon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: onChangePasswordVisibility,
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                ),
                filled: true,
              ),
              obscureText: !isPasswordVisible,
              validator: (value) =>
                  value.isPassword("It should be a valid password"),
            )
          ],
        ),
      );
}
