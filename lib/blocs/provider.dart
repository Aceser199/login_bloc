import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';

// Scoped instance of the Bloc
// Possibly better for larger apps
class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.bloc;
  }
}
