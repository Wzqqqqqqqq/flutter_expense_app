import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: Image.asset(
                    'assets/images/image1.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transactions[index].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
