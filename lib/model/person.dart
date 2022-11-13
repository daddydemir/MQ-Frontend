// ignore_for_file: unnecessary_getters_setters, unnecessary_this

class Person {
  int? _id;
  String? _nickname;
  String? _email;
  String? _password;
  String? _profileImage;

  Person(
      {int? id,
      String? nickname,
      String? email,
      String? password,
      String? profileImage}) {
    if (id != null) {
      this._id = id;
    }
    if (nickname != null) {
      this._nickname = nickname;
    }
    if (email != null) {
      this._email = email;
    }
    if (password != null) {
      this._password = password;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nickname => _nickname;
  set nickname(String? nickname) => _nickname = nickname;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;

  Person.fromJson(Map<String, dynamic> json) {
    _id = json['Id'];
    _nickname = json['Nickname'];
    _email = json['Email'];
    _password = json['Password'];
    _profileImage = json['ProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = _id;
    data['Nickname'] = _nickname;
    data['Email'] = _email;
    data['Password'] = _password;
    data['ProfileImage'] = _profileImage;
    return data;
  }
}
