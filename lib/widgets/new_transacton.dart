import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransactions;
  NewTransaction(this.addNewTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectDate = DateTime.now();

  void submitButton() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final chooseDate = _selectDate;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || chooseDate == null) {
      return;
    }
    widget.addNewTransactions(enteredTitle, enteredAmount, chooseDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((selectDate) {
      if (selectDate == null) {
        return;
      }
      setState(() {
        _selectDate = selectDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitButton(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitButton(),
            ),
            Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectDate == null
                          ? 'No date choosen'
                          : 'Date:${DateFormat.yMd().format(_selectDate)}',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Choose date',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: submitButton,
            )
          ],
        ),
      ),
    );
  }
}
