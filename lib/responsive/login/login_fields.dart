import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';

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
