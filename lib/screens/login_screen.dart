import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/provider.dart';
import 'package:login_bloc/responsive/login/desktop_login_body.dart';
import 'package:login_bloc/responsive/login/mobile_login_body.dart';
import 'package:login_bloc/responsive/login/tablet_login_body.dart';
import 'package:login_bloc/responsive/responsive_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const ResponsiveLayout(
        mobileScaffold: MobileLoginBody(),
        tabletScaffold: TabletLoginBody(),
        desktopScaffold: DesktopLoginBody(),
      ),
    );
  }
}
