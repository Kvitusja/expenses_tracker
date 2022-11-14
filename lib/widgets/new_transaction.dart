import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(amountController.text.isEmpty){
      return;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_selectedDate == null
                    ? 'No date chosen'
                    : DateFormat.yMd().format(_selectedDate!)),
                const SizedBox(
                  width: 7,
                ),
                ElevatedButton(
                  onPressed: _presentDatePicker,
                  child: const Text(
                    'Choose date',
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitData();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add Transaction',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //   style: const ButtonStyle(
            //       //backgroundColor: MaterialStatePropertyAll(Colors.blue),
            //       ),
            //   onPressed: () {
            //     // widget.addNewTransaction(
            //     //   titleController.text,
            //     //   double.parse(amountController.text),
            //     // );
            //     _submitData();
            //     Navigator.of(context).pop();
            //   },
            //   child: const Text(
            //     'Add Transaction',
            //     //style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
