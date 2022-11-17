import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}