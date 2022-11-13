// ignore_for_file: unnecessary_this, unnecessary_getters_setters

import 'package:mq_frontend/model/person.dart';

class Answer {
  int? _id;
  int? _questionId;
  String? _content;
  String? _updateDate;

  Person? person;

  Answer({int? id, int? questionId, String? content, String? updateDate}) {
    if (id != null) {
      this._id = id;
    }
    if (questionId != null) {
      this._questionId = questionId;
    }
    if (content != null) {
      this._content = content;
    }
    if (updateDate != null) {
      this._updateDate = updateDate;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get questionId => _questionId;
  set questionId(int? questionId) => _questionId = questionId;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get updateDate => _updateDate;
  set updateDate(String? updateDate) => _updateDate = updateDate;

  Answer.fromJson(Map<String, dynamic> json) {
    _id = json['Id'];
    _questionId = json['QuestionId'];
    _content = json['Content'];
    _updateDate = json['UpdateDate'];
    person = Person.fromJson(json['Person']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = this._id;
    data['QuestionId'] = this._questionId;
    data['Content'] = this._content;
    data['UpdateDate'] = this._updateDate;
    return data;
  }
}
