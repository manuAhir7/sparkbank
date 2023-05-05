// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sparkbank/model/usermodel.dart';
import 'package:sparkbank/database/bankdb.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController mobileController = TextEditingController();
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController balanceController = TextEditingController();
 final TextEditingController accountController = TextEditingController();
 final TextEditingController ifscController = TextEditingController();

  Future<void> createNewEntry() async {
    final name = nameController.text;
    final email = emailController.text;
    final balance = int.parse(balanceController.text);
    final account = int.parse(accountController.text);
    final phonenumber = int.parse(mobileController.text);
    final ifsc = ifscController.text;

    final info = Info(
        phonenumber: phonenumber,
        name: name,
        email: email,
        balance: balance,
        account: account,
        ifsc: ifsc);
    await Sparkbank.instance.insertEntry(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name',
                    
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',

                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                  ),

                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: mobileController,
                  decoration: const InputDecoration(labelText: 'Phone number',
                    border: OutlineInputBorder(),

                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: balanceController,
                  decoration: const InputDecoration(labelText: 'Balance',
                    border: OutlineInputBorder(),

                    prefixIcon: Icon(Icons.money),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a balance';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: accountController,
                  decoration: const InputDecoration(labelText: 'Account',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_balance),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an account number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: ifscController,
                  decoration: const InputDecoration(labelText: 'IFSC Code',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.qr_code),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an IFSC code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await createNewEntry(); // Call the async method outside setState()
                        if (mounted) {
                          setState(() {
                            Navigator.pushReplacementNamed(context, '/user');
                            Fluttertoast.showToast(
                              msg: "Add user successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black.withOpacity(0.5),
                              textColor: Colors.white,
                              fontSize: 14.0,
                            );
                          });
                        }
                      }
                    }, child: const Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}