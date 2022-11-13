import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/model/question.dart';
import 'package:mq_frontend/pages/loginpage.dart';
import 'package:mq_frontend/service/question_service.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({super.key});

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  var data = Local();
  bool isLogin = true;
  Person person = Person();
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    if (data.ReadCookie("token").isNotEmpty) {
      isLogin = false;
      person = Person.fromJson(json.decode(data.ReadCookie("user")));
      _getAllQuestions();
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
      body: questions.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  questions[index].image.toString(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: Text(
                              questions[index].title.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 1.7 *
                                          MediaQuery.of(context).size.width *
                                          0.008),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
          isLogin
              ? Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginPage.route);
                    },
                    child: const Text("Login"),
                  ),
                )
              : _person(),
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

  void _getAllQuestions() async {
    var service = QuestionService();

    questions = await service.GetAll();
    setState(() {});
  }
}
