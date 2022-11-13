import 'dart:convert';

import 'package:mq_frontend/api/question_api.dart';
import 'package:mq_frontend/model/question.dart';

class QuestionService {
  var api = QuestionApi();

  Future<bool> Add(Question question) async {
    var response = await api.Add(question);

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Question>> GetAll() async {
    List<Question> questions = [];

    var response = await api.GetAll();
    var r = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      var data = r['data'];
      for (var i in data) {
        questions.add(Question.fromJson(i));
      }
    }

    return questions;
  }

  Future<Question> GetById(var id) async {
    Question question = Question();

    var response = await api.GetById(id);
    var r = json.decode(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200){
      question = Question.fromJson(r['data']);
    }
    return question;
  }
}
