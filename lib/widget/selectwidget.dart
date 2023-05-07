// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sparkbank/database/bankdb.dart';

class Usergrid extends StatefulWidget {
  final int index;
  final String user;
  final String amount;
  final String name;

  const Usergrid(
      {Key? key,
      required this.index,
      required this.user,
      required this.amount,
      required this.name})
      : super(key: key);

  @override
  State<Usergrid> createState() => _UsergridState();
}

class _UsergridState extends State<Usergrid> {
  bool _isCancelled = false;

  @override
  Widget build(BuildContext context) {
    int enterAmount = int.parse(widget.amount);

    return GestureDetector(
      onTap: () {
        showDialog(
            // barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Are you sure want to continue."),
                actions: [
                  TextButton(
                      onPressed: () async {
                        setState(() {
                          _isCancelled = true;
                        });
                        Fluttertoast.showToast(
                          msg: "Transaction was cancel",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          textColor: Colors.white,
                          fontSize: 14.0,
                        );
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/user');
                        await Sparkbank.instance.transferAmount(widget.index,
                            widget.name, 'cancelled', enterAmount);
                      },
                      child: const Text("cancel")),
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/user');
                        Fluttertoast.showToast(
                          msg: "Transaction was successful",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          textColor: Colors.white,
                          fontSize: 14.0,
                        );
                        await Sparkbank.instance.transferAmount(widget.index,
                            widget.name, widget.user, enterAmount);
                      },
                      child: const Text("send")),
                ],
              );
            });
      },
      child: Card(
        color: _isCancelled
            ? Colors.red.withOpacity(0.5)
            : Colors.green.withOpacity(0.5),
        elevation: 4.0,
        semanticContainer: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        margin: const EdgeInsets.fromLTRB(4, 7, 4, 7),
        child: SizedBox(
          width: 111,
          height: 111,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage('images/avatar.jpg'),
              ),
              const SizedBox(height: 7),
              Flexible(
                child: SizedBox(
                  width: 120,
                  child: Text(
                    widget.user,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
