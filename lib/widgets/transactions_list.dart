import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionsList extends StatefulWidget {
  final Function deleteTransaction;
  final List<Transactions> transactions;
  const TransactionsList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      child: widget.transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'No transactions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/money.png'),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemCount: widget.transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FittedBox(
                            child:
                                Text('€ ${widget.transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      widget.transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(widget.transactions[index].date),
                    ),
                    trailing: IconButton(
                        onPressed: () => widget
                            .deleteTransaction(widget.transactions[index].id),
                        icon: const Icon(Icons.cancel_outlined)),
                  ),
                );
              },
            ),
    );
  }
}
