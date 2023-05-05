import 'package:flutter/material.dart';
import 'package:sparkbank/screens/home.dart';
import 'package:sparkbank/screens/userselect.dart';
import 'package:sparkbank/screens/udata.dart';
import 'package:sparkbank/screens/userslist.dart';
import 'package:sparkbank/screens/transactionscreen.dart';
import 'package:sparkbank/screens/usercard.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => const Home(),
        "/user": (context) => const Users(),
        "/data": (context) => const Data(),
        "/transact": (context) => const Select(),
        "/entry": (context) => const AddEntry(),
        "/history": (context) => const TransactionHistory(),
      },
    );
  }
}

