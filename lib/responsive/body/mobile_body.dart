import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/model/question.dart';
import 'package:mq_frontend/pages/loginpage.dart';
import 'package:mq_frontend/service/question_service.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
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
        centerTitle: true,
        title: const Text("M Q"),
        actions: [
          const Center(
            child: Text("Questions"),
          ),
          const SizedBox(width: 10),
          isLogin
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginPage.route);
                  },
                  child: const Center(
                    child: Text("Login"),
                  ),
                )
              : _person(),
          const SizedBox(width: 10),
        ],
      ),
      body: questions.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 20,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      questions[index].image.toString()),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              questions[index].title.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }

  Widget _person() {
    return InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(25),
          child:
              Image.network(person.profileImage.toString(), fit: BoxFit.cover),
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
