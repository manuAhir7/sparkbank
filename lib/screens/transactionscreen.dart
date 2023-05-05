import 'package:flutter/material.dart';
import 'package:sparkbank/widget/transactwidget.dart';
import 'package:sparkbank/database/bankdb.dart';
import 'package:sparkbank/model/transactionmodel.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  late List<MyTransaction> _transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    final List<MyTransaction> transactions =
    await Sparkbank.instance.readAllTransactions();
    setState(() {
      _transactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: _transactions.isEmpty
          ? const Center(
        child: Text(
          'No Transactions Found',
          style: TextStyle(color: Colors.green, fontSize: 20.0),
        ),
      )
          : ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final MyTransaction transaction = _transactions[index];
          return Transactbar(transaction: transaction);
        },
      ),
    );
  }
}
