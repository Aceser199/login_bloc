import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';
import 'package:login_bloc/blocs/provider.dart';

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

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => TextFormField(
        initialValue: bloc.emailValue,
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

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) => TextFormField(
        initialValue: bloc.passwordValue,
        obscureText: true,
        decoration: InputDecoration(
          label: const Text('Password'),
          errorText: snapshot.error?.toString(),
        ),
        onChanged: bloc.changePassword,
      ),
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) => ElevatedButton(
        onPressed: snapshot.hasData ? bloc.submit : null,
        child: const Text('Submit'),
      ),
    );
  }
}
