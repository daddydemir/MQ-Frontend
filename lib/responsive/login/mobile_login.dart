import 'package:flutter/material.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({Key? key}) : super(key: key);

  static const String route = '/login-m';

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final _mail = TextEditingController();
  final _password = TextEditingController();
  bool secureText = true;

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

  void _login() {}
}
