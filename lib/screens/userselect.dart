import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:sparkbank/widget/selectwidget.dart';
import 'package:sparkbank/database/bankdb.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  List<String> userList = [];

  Future<void> loadUsers(String name) async {
    final users = await Sparkbank.instance.getAllNamesExcept(name);
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as Map;
    String name = info["name"];
    String amount = info["amount"];
    loadUsers(name);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Transfer Money",
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: const [
                Text("Select User to Transfer Money ⬇️",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  userList.length, // Replace with your actual number of items
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Usergrid(
                  user: userList[index],
                  index: index,
                  amount: amount,
                  name: name,
                ); // Replace with your actual card widget
              },
            ),
          ),
        ])));
  }
}
