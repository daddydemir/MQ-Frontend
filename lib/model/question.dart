// ignore_for_file: unnecessary_this, unnecessary_getters_setters

import 'package:mq_frontend/model/person.dart';

class Question {
  int? _id;
  String? _title;
  int? _personId;
  String? _createdDate;
  String? _image;

  Person? person;

  Question(
      {int? id,
      String? title,
      int? personId,
      String? createdDate,
      String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (personId != null) {
      this._personId = personId;
    }
    if (createdDate != null) {
      this._createdDate = createdDate;
    }
    if (image != null) {
      this._image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get personId => _personId;
  set personId(int? personId) => _personId = personId;
  String? get createdDate => _createdDate;
  set createdDate(String? createdDate) => _createdDate = createdDate;
  String? get image => _image;
  set image(String? image) => _image = image;

  Question.fromJson(Map<String, dynamic> json) {
    _id = json['Id'];
    _title = json['Title'];
    _personId = json['PersonId'];
    _createdDate = json['CreatedDate'];
    _image = json['Image'];
    person = Person.fromJson(json['Person']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = this._id;
    data['Title'] = this._title;
    data['PersonId'] = this._personId;
    data['CreatedDate'] = this._createdDate;
    data['Image'] = this._image;
    return data;
  }
}
