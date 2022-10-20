import 'package:expenses_tracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

import 'models/transactions.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

   //List<Transactions> transactions;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.white70,
                  elevation: 5,
                  child: Text('CHART!'),
                ),
              ),
              const UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
