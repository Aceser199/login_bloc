import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';
import 'package:login_bloc/responsive/login/desktop_login_body.dart';
import 'package:login_bloc/responsive/login/mobile_login_body.dart';
import 'package:login_bloc/responsive/login/tablet_login_body.dart';
import 'package:login_bloc/responsive/responsive_layout.dart';

final bloc = Bloc();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const ResponsiveLayout(
        mobileScaffold: MobileLoginBody(),
        tabletScaffold: TabletLoginBody(),
        desktopScaffold: DesktopLoginBody(),
      ),
    );
  }
}
