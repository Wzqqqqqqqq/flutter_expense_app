import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 49.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new cloth', amount: 33.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                child: Text('aaaaa', style: TextStyle(color: Colors.white)),
                width: double.infinity,
                alignment: Alignment.center,
              ),
              elevation: 10,
            ),
            Column(
              children: <Widget>[
                Column(
                    children: transactions
                        .map((item) => Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.purple, width: 2)),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        item.amount.toString(),
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(item.title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        item.date.toIso8601String(),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                        .toList())
              ],
            )
          ],
        ));
  }
}
