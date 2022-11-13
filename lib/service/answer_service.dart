
import 'dart:convert';

import 'package:mq_frontend/api/answer_api.dart';
import 'package:mq_frontend/model/answer.dart';

class AnswerService{

  var api = AnswerApi();

  Future<bool> Add(Answer answer) async {

    var response = await api.Add(answer);

    if(response.statusCode == 201){
      return true;
    }
    return false;
  }

  Future<Answer> GetById(var id) async {
    Answer answer = Answer();

    var response = await api.GetById(id);
    var r = json.decode(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200){
      answer = Answer.fromJson(r['data']);
    }

    return answer;
  }
}