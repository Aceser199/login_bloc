import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';

final bloc = Bloc();

class TabletLoginBody extends StatelessWidget {
  const TabletLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(),
            passwordField(),
            const SizedBox(height: 20.0),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'your@example.com',
          label: const Text('Email Address'),
          errorText: snapshot.error?.toString(),
        ),
        onChanged: bloc.changeEmail,
      ),
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) => TextField(
        obscureText: true,
        decoration: InputDecoration(
          label: const Text('Password'),
          errorText: snapshot.error?.toString(),
        ),
        onChanged: bloc.changePassword,
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Submit'),
    );
  }
}
