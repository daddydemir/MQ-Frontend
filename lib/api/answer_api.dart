// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/answer.dart';
import 'package:mq_frontend/responsive/dimensions.dart';

class AnswerApi {
  var data = Local();

  Future Add(Answer answer) async {
    var url = Uri.parse("${base}answer/add");

    return await http.post(url,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": data.ReadCookie("token")
        },
        body: answer.toJson());
  }

  Future GetById(var id) async {
    var url = Uri.parse("${base}answer/$id");

    return await http.get(
      url,
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": data.ReadCookie("token")
      },
    );
  }
}
