import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

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
  final List<Transaction> txList = [
    Transaction(
      id: 't1',
      title: 'new coat',
      amount: 55.60,
      txDate: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'lunch',
      amount: 5.75,
      txDate: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'flight',
      amount: 133.90,
      txDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.lightBlue,
              child: Text('Chart Placeholder'),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'enter title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'enter amount'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('add transaction'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: txList.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.purple,
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      ('\$ ${tx.amount.toStringAsFixed(2)}'),
                      style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(tx.txDate),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
