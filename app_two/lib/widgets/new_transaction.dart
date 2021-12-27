import 'package:flutter/material.dart';

typedef AddTransactionFunction = void Function(String title, double amount);

class NewTransaction extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final AddTransactionFunction _addTransactionFunction;

  NewTransaction(this._addTransactionFunction, {Key? key}) : super(key: key);

  void _submitNewTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount == null) {
      return;
    }

    _addTransactionFunction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => _submitNewTransaction(),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitNewTransaction(),
            ),
            TextButton(
              onPressed: _submitNewTransaction,
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
