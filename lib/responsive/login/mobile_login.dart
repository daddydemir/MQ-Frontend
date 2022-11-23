// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mq_frontend/core/check.dart';
import 'package:mq_frontend/service/auth_service.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final _mail = TextEditingController();
  final _password = TextEditingController();
  bool secureText = true;
  var ctrl = Check();

  @override
  void initState() {
    super.initState();
    if(ctrl.LoginControl()){
      // oturum zaten açıksa
      Navigator.of(context).pushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text("L O G I N"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipOval(
                    child: SizedBox.fromSize(
                  size: const Size.fromRadius(90),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/42716195?v=4",
                    fit: BoxFit.cover,
                  ),
                )),
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _mail,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("E-Mail"),
                  suffixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
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
              const SizedBox(height: 50),
              const Center(child: Text("Şifremi unuttum?")),
              const SizedBox(height: 50),
              TextButton(
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
    bool status = await service.Login(_mail.text, _password.text);
    if (status){
      // print("oturum açma okey.");
      Navigator.of(context).pushReplacementNamed('/');

    }
  }
}
