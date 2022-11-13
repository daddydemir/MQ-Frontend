// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/question.dart';
import 'package:mq_frontend/responsive/dimensions.dart';

class QuestionApi {
  var data = Local();

  Future Add(Question question) async {
    var url = Uri.parse("${base}question/add");

    return await http.post(url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": data.ReadCookie("token")
        },
        body: question.toJson());
  }

  Future GetAll() async {
    var url = Uri.parse("${base}questions");

    return await http.get(url, headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": data.ReadCookie("token")
    });
  }

  Future GetById(var id) async {
    var url = Uri.parse("${base}question/$id");

    return await http.get(url, headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": data.ReadCookie("token")
    });
  }
}
