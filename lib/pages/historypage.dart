import 'package:flutter/material.dart';
import 'package:mq_frontend/core/check.dart';
import 'package:mq_frontend/pages/loginpage.dart';
import 'package:mq_frontend/responsive/history/desktop_history.dart';
import 'package:mq_frontend/responsive/history/mobile_history.dart';
import 'package:mq_frontend/responsive/responsive_layout.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  static const String route = '/history';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var core = Check();

  @override
  void initState() {
    super.initState();

    bool isTrue = core.LoginControl();
    if (!isTrue) {
      Navigator.of(context).pushNamed(LoginPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileHistory(), desktopBody: DesktopHistory()),
    );
  }
}
