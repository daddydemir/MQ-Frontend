import 'package:flutter/material.dart';
import 'package:mq_frontend/responsive/body/desktop_body.dart';
import 'package:mq_frontend/responsive/body/mobile_body.dart';
import 'package:mq_frontend/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(),
        desktopBody: MyDesktopBody(),
      ),
    );
  }
}
