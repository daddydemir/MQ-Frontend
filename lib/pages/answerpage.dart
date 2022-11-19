import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/pages/loginpage.dart';
import 'package:mq_frontend/responsive/answers/desktop_answer.dart';
import 'package:mq_frontend/responsive/answers/mobile_answer.dart';
import 'package:mq_frontend/responsive/responsive_layout.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key, required this.id});

  final String id;
  static const String route = '/answer';

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {

  var data = Local();
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    if(data.ReadCookie("token").isEmpty) {
      Navigator.of(context).pushNamed(LoginPage.route);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileAnswer(),
        desktopBody: DesktopAnswer(questionId: "1",),
      ),
    );
  }
}
