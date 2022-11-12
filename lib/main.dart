import 'package:flutter/material.dart';
import 'package:mq_frontend/homepage.dart';
import 'package:mq_frontend/responsive/login/desktop_login.dart';
import 'package:mq_frontend/responsive/login/mobile_login.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: HomePage.route,
      routes : 
      {
        HomePage.route: (context) => const HomePage(),
        MobileLogin.route: (context) => const MobileLogin(),
        DesktopLogin.route: (context) => const DesktopLogin(),
      },
    );
  }
}