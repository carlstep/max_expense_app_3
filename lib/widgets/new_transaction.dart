import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          //margin: const EdgeInsets.all(4),
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                // onChanged: (value) {
                //   titleInput = value;
                // },
                decoration: const InputDecoration(labelText: 'enter title'),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //onChanged: (value) => amountInput = value,
                decoration: const InputDecoration(labelText: 'enter amount'),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : 'Selected Date: ${DateFormat.yMd().format(_selectedDate!).toString()}',
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _presentDatePicker,
                            child: Text(
                              'Select Date',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: _presentDatePicker,
                            child: Text(
                              'Select Date',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
