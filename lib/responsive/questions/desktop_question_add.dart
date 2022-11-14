// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/model/question.dart';
import 'package:mq_frontend/pages/loginpage.dart';
import 'package:mq_frontend/service/question_service.dart';

class DesktopQuestionAdd extends StatefulWidget {
  const DesktopQuestionAdd({super.key});

  @override
  State<DesktopQuestionAdd> createState() => _DesktopQuestionAddState();
}

class _DesktopQuestionAddState extends State<DesktopQuestionAdd> {
  var data = Local();
  bool isLogin = true;
  Person person = Person();

  final _question = TextEditingController();
  final _image = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (data.ReadCookie("token").isNotEmpty) {
      isLogin = false;
      person = Person.fromJson(json.decode(data.ReadCookie("user")));
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text("M Q"),
        titleSpacing: MediaQuery.of(context).size.width * 0.2,
        actions: _actions(),
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
                errorBuilder: (context, exception, stackTrace) {
                  return const Text("Resim uygun değil!");
                },
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
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
                padding: const EdgeInsets.all(8),
                child: Text(
                  "ADD",
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

  List<Widget> _actions() {
    List<Widget> liste = [];
    liste.add(SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Row(
        children: [
          const Expanded(child: Text("Questions")),
          _person(),
        ],
      ),
    ));
    return liste;
  }

  Widget _person() {
    return Expanded(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(25),
                child: Image.network(
                  person.profileImage.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(person.nickname.toString()),
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
