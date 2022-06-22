import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTran;

  NewTransaction(this.addTran);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTran(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (e) => {titleInput = e},
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 147, 1, 167),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 147, 1, 167),
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 147, 1, 167),
                  ),
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (e) => {amountInput = e},
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: _submitData,
                child: const Text('Add Expense'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
