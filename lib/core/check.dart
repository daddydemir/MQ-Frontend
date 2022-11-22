import 'package:mq_frontend/data/local.dart';

class Check{

  var data = Local();

  bool LoginControl(){
    if(data.ReadCookie('token').isEmpty){
      return false;
    }
    return true;
  }

}