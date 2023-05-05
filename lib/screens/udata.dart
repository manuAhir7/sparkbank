// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sparkbank/widget/udatawidget.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as Map;
    // ignore: unnecessary_null_comparison

    String name = info["name"];
    String mobile = info["mobile"];
    String email = info["email"];
    String account = info["account"];
    String ifsc = info["ifsc"];
    String balance = info["balance"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
           Container(
             margin: const EdgeInsets.only(top: 35),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.savings_outlined, color: Colors.green),
                SizedBox(width: 4),
                Text("Spark User",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
          ),
           ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.fromLTRB(42, 20, 42, 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
              color: Colors.green.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('images/avatar.jpg'),
                              ),
                            )

                          ],
                        ),
                      ),
                       Udata(name: name, mobile: mobile, email: email, account: account, ifsc:  ifsc, balance:  balance),
                    ],
                  ),
                )
              ],
            ),
          ),
          //Transfer money button....................................................................................................
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Enter an amount."),
                        content: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(labelText: "Rupees"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some amount';
                              } else if (int.tryParse(value) == null ||
                                  int.parse(value) <= 0) {
                                return 'Please enter a valid amount';
                              } else if (int.parse(balance) <
                                  int.parse(value)) {
                                return 'Enter amount less than or equal to balance';
                              }
                              return null;
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              amountController.clear();
                            },
                            child: const Text("Go back"),
                          ),
                          TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.of(context).pushReplacementNamed(
                                  '/transact',
                                  arguments: {
                                    'amount': amountController.text,
                                    'name': name,
                                  },
                                );
                              }
                              amountController.clear();
                            },
                            child: const Text("Send"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.monetization_on_outlined, size: 18),
                label: const Text("Transfer Money"),
              )
            ],
          )
        ],
      ),
    );
  }
}

