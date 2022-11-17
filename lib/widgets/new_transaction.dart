import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
              decoration: InputDecoration(labelText: 'enter title'),
            ),
            TextField(
              controller: amountController,
              //onChanged: (value) => amountInput = value,
              decoration: InputDecoration(labelText: 'enter amount'),
            ),
            TextButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text('add transaction'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
