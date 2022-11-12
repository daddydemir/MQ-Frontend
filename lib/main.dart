import 'package:flutter/material.dart';
import 'package:mq_frontend/homepage.dart';
import 'package:mq_frontend/responsive/loginpage.dart';

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
        LoginPage.route: (context) => const LoginPage(),
      },
    );
  }
}