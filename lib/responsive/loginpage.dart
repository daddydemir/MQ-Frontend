
import 'package:flutter/material.dart';
import 'package:mq_frontend/responsive/login/desktop_login.dart';
import 'package:mq_frontend/responsive/login/mobile_login.dart';
import 'package:mq_frontend/responsive/responsive_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileLogin(),
        desktopBody: DesktopLogin(),
      ),
    );
  }
}