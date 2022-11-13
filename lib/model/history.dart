// ignore_for_file: unnecessary_this, unnecessary_getters_setters

import 'package:mq_frontend/model/person.dart';

class History {
  int? _id;
  int? _personId;
  String? _time;
  String? _ipAddress;

  Person? person;

  History({int? id, int? personId, String? time, String? ipAddress}) {
    if (id != null) {
      this._id = id;
    }
    if (personId != null) {
      this._personId = personId;
    }
    if (time != null) {
      this._time = time;
    }
    if (ipAddress != null) {
      this._ipAddress = ipAddress;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get personId => _personId;
  set personId(int? personId) => _personId = personId;
  String? get time => _time;
  set time(String? time) => _time = time;
  String? get ipAddress => _ipAddress;
  set ipAddress(String? ipAddress) => _ipAddress = ipAddress;

  History.fromJson(Map<String, dynamic> json) {
    _id = json['Id'];
    _personId = json['PersonId'];
    _time = json['Time'];
    _ipAddress = json['IpAddress'];
    person = Person.fromJson(json['Person']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = this._id;
    data['PersonId'] = this._personId;
    data['Time'] = this._time;
    data['IpAddress'] = this._ipAddress;
    return data;
  }
}
