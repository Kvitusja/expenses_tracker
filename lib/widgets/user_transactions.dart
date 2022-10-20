import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:expenses_tracker/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transactions> userTransactions = [
    Transactions(
      id: 't1',
      title: 'New shoes',
      amount: 33.25,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'New books',
      amount: 14.2,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String newTitle, double newAmount) {
    final newTransaction = Transactions(
      title: newTitle,
      amount: newAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction: _addNewTransaction),
        TransactionsList(transactions: userTransactions),
      ],
    );
  }
}
