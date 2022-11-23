// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mq_frontend/core/check.dart';
import 'package:mq_frontend/model/question.dart';
import 'package:mq_frontend/service/question_service.dart';

class MobileQuestionAdd extends StatefulWidget {
  const MobileQuestionAdd({super.key});

  @override
  State<MobileQuestionAdd> createState() => _MobileQuestionAddState();
}

class _MobileQuestionAddState extends State<MobileQuestionAdd> {
  final _image = TextEditingController();
  final _question = TextEditingController();
  var ctrl = Check();

  @override
  void initState() {
    super.initState();
    if(!ctrl.LoginControl()){
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.network(
                _image.text,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.5,
                errorBuilder: (context, exception, stackTrace) {
                  return const Text("Resim uygun değil!");
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value){
                _image.text = value;
                setState(() {});
              },
              controller: _image,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text("Image"),
                suffixIcon: Icon(Icons.image_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _question,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                label: Text("What do you think?"),
                suffixIcon: Icon(Icons.question_mark_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _addQuestion,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'ADD',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
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
          ],
        ),
      ),
    );
  }

  _addQuestion() async {
     var service = QuestionService();
    Question question = Question();
    question.title = _question.text;
    question.image = _image.text;

    List status = await service.Add(question);
    
    AlertDialog alert =  AlertDialog(
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
