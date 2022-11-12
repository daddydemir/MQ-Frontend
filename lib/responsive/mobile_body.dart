import 'package:flutter/material.dart';
import 'package:mq_frontend/responsive/login/mobile_login.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("M Q"),
        actions: [
          const Center(
            child: Text("Questions"),
          ),
          const SizedBox(width: 10),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(MobileLogin.route);
              },
              child: const Center(
                child: Text("Login"),
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    height: 250,
                    color: Colors.deepPurple[400],
                  ),
                ),
              ),

              // another widgets ...

              Expanded(
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 120,
                            color: Colors.deepPurple[300],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
