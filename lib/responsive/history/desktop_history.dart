import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/history.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/service/auth_service.dart';

class DesktopHistory extends StatefulWidget {
  const DesktopHistory({super.key});

  @override
  State<DesktopHistory> createState() => _DesktopHistoryState();
}

class _DesktopHistoryState extends State<DesktopHistory> {
  List<History> histories = [];
  var person = Person();
  var data = Local();

  @override
  void initState() {
    super.initState();
    _getHistory();
    person = Person.fromJson(json.decode(data.ReadCookie('user')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(),
        title: const Text('M Q'),
        titleSpacing: MediaQuery.of(context).size.width * 0.2,
      ),
      body: SingleChildScrollView(
        child: histories.isEmpty
            ? const CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Image.network(
                            person.profileImage ?? '',
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                        Column(
                          children: [
                            Text(person.nickname ?? '',
                                style: Theme.of(context).textTheme.headline4),
                            Text(person.email ?? 'mehmetcakmaktasi@yaani.com',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ],
                    ),
                    // ListView
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(child: tableElement('Date')),
                        Expanded(child: tableElement('IP Address')),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: histories.length,
                          itemBuilder: (context, i) {
                            return Row(children: [
                              Expanded(
                                child: Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(histories[i].time ?? ''),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(histories[i].ipAddress ?? ''),
                                  ),
                                ),
                              ),
                            ]);
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Card tableElement(String v) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(v),
      ),
    );
  }

  void _getHistory() async {
    var service = AuthService();
    histories = await service.GetHistoryById(1);
    setState(() {});
  }
}
