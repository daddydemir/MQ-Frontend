import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/history.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/service/auth_service.dart';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});
  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  final _mail = TextEditingController();
  final _password = TextEditingController();
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text("M Q"),
        titleSpacing: 200,
        flexibleSpace: Center(
          child: Text(
            "L O G I N",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Center(
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(120),
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/42716195?v=4",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              // textField
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: 500,
                  child: Center(
                    child: TextField(
                      controller: _mail,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("E-Mail"),
                        suffixIcon: Icon(Icons.mail),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  controller: _password,
                  obscureText: secureText,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: _changeSecureText,
                      icon: Icon(secureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Şifremi unuttum?"),
              ),
              SizedBox(
                width: 500,
                child: TextButton(
                  onPressed: _login,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple[400],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "LOGIN",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeSecureText() {
    setState(() {
      secureText = !secureText;
    });
  }

  void _login() async {
    var service = AuthService();
    // bool status = await service.Login(_mail.text, _password.text);
    // if (status){
    //   print("oturum açma okey.");

    // }
    // test data

    var data = Local();
    Person person = Person();
    person.profileImage = "https://www.donanimhaber.com/images/images/haber/151519/1400x1050yapay-zek-resim-olusturuyor.jpg";
    person.nickname = "mehmet";
    data.AddCookie(name: "user", value: jsonEncode(person));
  }
}
