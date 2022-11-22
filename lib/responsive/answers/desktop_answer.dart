// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/answer.dart';
import 'package:mq_frontend/service/answer_service.dart';

import 'package:html_editor_enhanced/html_editor.dart';

class DesktopAnswer extends StatefulWidget {
  const DesktopAnswer({super.key, required this.questionId});

  final String questionId;

  @override
  State<DesktopAnswer> createState() => _DesktopAnswerState();
}

class _DesktopAnswerState extends State<DesktopAnswer> {
  var data = Local();
  List<Answer> answers = [];

  final _controller = HtmlEditorController();

  @override
  void initState() {
    super.initState();
    _getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text('M Q'),
        titleSpacing: MediaQuery.of(context).size.width * 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            answers.isEmpty
                ? const CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 20,
                        child: Stack(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      answers[0].question?.image ?? ""),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              answers[0].question?.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.white,
                                    backgroundColor: Colors.black,
                                  ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
            // answers and add answer
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: SingleChildScrollView(
                // height: MediaQuery.of(context).size.height,
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
                              child: Text(answers[index].updateDate ?? ""),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(answers[index].content.toString() * 100),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: const Text("C E V A P L A"),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: HtmlEditor(
                controller: _controller,
                htmlToolbarOptions: const HtmlToolbarOptions(
                  toolbarType: ToolbarType.nativeGrid,
                ),
                htmlEditorOptions: const HtmlEditorOptions(
                  hint: "insane !",
                  darkMode: false,
                ),
                otherOptions: OtherOptions(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.deepPurple, width: 8)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: TextButton(
                  onPressed: _addAnswer,
                  child: Text(
                    "S A V E",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontSize:25,
                      fontWeight: FontWeight.w400
                    ),
                  ),
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
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  _getAll() async {
    var service = AnswerService();
    answers = await service.GetById(widget.questionId);
    setState(() {});
  }

  _addAnswer() async {
    // var txt = await _controller.getText();
    
  }
}
