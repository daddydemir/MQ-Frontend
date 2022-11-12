import 'package:flutter/material.dart';
import 'package:mq_frontend/responsive/loginpage.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({super.key});

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text("M Q"),
        titleSpacing: MediaQuery.of(context).size.width * 0.2,
        actions: _actions(),
      ),
    );
  }

  List<Widget> _actions() {
    List<Widget> liste = [];
    liste.add(SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Row(
        children: [
          const Expanded(child: Text("Questions")),
          Expanded(
              child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginPage.route);
                  },
                  child: const Text("Login"))),
        ],
      ),
    ));
    return liste;
  }
}
