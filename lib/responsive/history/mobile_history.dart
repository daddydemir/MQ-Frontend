import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/model/history.dart';
import 'package:mq_frontend/model/person.dart';
import 'package:mq_frontend/service/auth_service.dart';

class MobileHistory extends StatefulWidget {
  const MobileHistory({super.key});

  @override
  State<MobileHistory> createState() => _MobileHistoryState();
}

class _MobileHistoryState extends State<MobileHistory> {
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
        title: const Text("H I S T O R Y "),
        centerTitle: true,
      ),
      body: histories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02, vertical: 20)
                    .copyWith(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.network(
                      person.profileImage ?? '',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.3,
                    )),
                    Text(person.nickname ?? '',
                        style: Theme.of(context).textTheme.headline4),
                    Text(
                      person.email ?? 'mehmetcakmaktasi@yaani.com',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: tableElement('Date'),
                        ),
                        Expanded(child: tableElement('IP Address')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: histories.length,
                        itemBuilder: (context, i) {
                          return Row(children: [
                            Expanded(child: tableElement(histories[i].time ?? '')),
                            Expanded(child: tableElement(histories[i].ipAddress ?? '')),
                          ]);
                        })
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
        ));
  }

  void _getHistory() async {
    var service = AuthService();
    histories = await service.GetHistoryById(1);
    setState(() {});
  }
}
