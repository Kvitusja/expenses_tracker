import 'package:expenses_tracker/transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transactions> transactions = [
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

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.orangeAccent,
                child: Text('CHART!'),
              ),
            ),
            Column(
                children: transactions
                    .map(
                      (transaction) => Card(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black87, width: 2)),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Text(transaction.amount.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  transaction.date.toString(),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
    );
  }
}
