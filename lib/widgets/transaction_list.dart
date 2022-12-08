import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Opacity(
              opacity: 0.5,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'No Transactions added',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        // TODO - circle avatar color/theme
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].txDate),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTx(transactions[index].id),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
