import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mq_frontend/core/check.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/answer.dart';
import 'package:mq_frontend/service/answer_service.dart';
import 'package:flutter_html/flutter_html.dart';

class MobileAnswer extends StatefulWidget {
  const MobileAnswer({super.key});

  @override
  State<MobileAnswer> createState() => _MobileAnswerState();
}

class _MobileAnswerState extends State<MobileAnswer> {
  var data = Local();
  List<Answer> answers = [];
  var ctrl = Check();
  final _controller = HtmlEditorController();

  @override
  void initState() {
    super.initState();
    _getAll();
    if (!ctrl.LoginControl()) {
      Navigator.of(context).pushNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text('M Q'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            answers.isEmpty
                ? const CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02)
                        .copyWith(top: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      answers[0].question?.image ?? ''),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                answers[0].question?.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      backgroundColor: Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02)
                  .copyWith(top: 20),
              child: const Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: answers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(answers[index].updateDate ?? ''),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child:
                                Html(data: answers[index].content.toString()),
                          ),
                        ]),
                      );
                    }),
              ),
            ),
            // add answer design...
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: HtmlEditor(
                controller: _controller,
                htmlToolbarOptions: const HtmlToolbarOptions(
                  toolbarType: ToolbarType.nativeGrid,
                ),
                otherOptions: const OtherOptions(
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: _addAnswer,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurple[400],
                  ),
                ),
                child: Text(
                  "S A V E",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getAll() async {
    var service = AnswerService();
    answers = await service.GetById("1");
    setState(() {});
  }

  void _addAnswer() async {
    var service = AnswerService();
    Answer a = Answer();
    a.questionId = answers[0].questionId;
    a.content = _controller.getText().toString();
    List status = await service.Add(a);

    AlertDialog alert = AlertDialog(
      title: const Text('Questions'),
      content: Text(status[1].toString()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
