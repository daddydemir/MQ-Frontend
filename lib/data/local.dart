// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names

import 'dart:html';

class Local{

  void AddCookie({required String name, required String value}){

    document.cookie = "$name=$value";
  }

  void DeleteCookie({required String name}){
    AddCookie(name: name, value: '');
  }

  String ReadCookie(String name) {
    String nameEQ = "$name=";
    List<String> ca = document.cookie!.split(';');

    for(int i = 0; i < ca.length; i++){
      String c = ca[i];
      c = c.trim();
      if(c.indexOf(nameEQ) == 0){
        return c.substring(nameEQ.length);
      }
    }
    return '';
  }
}