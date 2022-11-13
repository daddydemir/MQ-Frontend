// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names

import 'dart:convert';


import 'package:mq_frontend/api/auth_api.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/history.dart';
import 'package:mq_frontend/model/person.dart';

class AuthService{

  var api = AuthApi();
  var data = Local();

  Future<bool> Login(var email, var password) async {

    var response = await api.Login(email, password);
    var r = json.decode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200){
      
      Person person = Person.fromJson(r["data"]);
      String token = r["token"];

      data.AddCookie(name: "token", value: token);
      data.AddCookie(name: "user", value: person.toJson().toString());
      return true;
    }
    print(r["message"]);
    return false;
  }

  Future<List<History>> GetHistoryById(var id) async {
    List<History> histories = [];

    var response = await api.GetHistoryById(id);
    var r = json.decode(utf8.decode(response.bodyBytes));

    if(response.statusCode == 200){
      var data = r['data'];
      for(var i in data){
        histories.add(History.fromJson(i));
      }
    } else{
      print(r['message']);
    }

    return histories;
  }
}