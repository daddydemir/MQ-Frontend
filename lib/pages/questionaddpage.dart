import 'package:flutter/material.dart';
import 'package:mq_frontend/responsive/questions/desktop_question_add.dart';
import 'package:mq_frontend/responsive/questions/mobile_question_add.dart';
import 'package:mq_frontend/responsive/responsive_layout.dart';

class QuestionAddPage extends StatefulWidget {
  const QuestionAddPage({super.key});

  static const String route = '/add-question';

  @override
  State<QuestionAddPage> createState() => _QuestionAddPageState();
}

class _QuestionAddPageState extends State<QuestionAddPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileQuestionAdd(),
        desktopBody: DesktopQuestionAdd(),
      ),
    );
  }
}
