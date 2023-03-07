import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/provider.dart';
import 'package:login_bloc/responsive/login/login_fields.dart';

class MobileLoginBody extends StatelessWidget {
  const MobileLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            const SizedBox(height: 20.0),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }
}
