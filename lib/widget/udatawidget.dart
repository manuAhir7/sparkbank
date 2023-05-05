import 'package:flutter/material.dart';

class Udata extends StatelessWidget {
  final String name;
  final String mobile;
  final String email;
  final String account;
  final String ifsc;
  final String balance;

  const Udata({
    Key? key,
    required this.name,
    required this.mobile,
    required this.email,
    required this.account,
    required this.ifsc,
    required this.balance
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      semanticContainer: true,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(7),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Container(
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Name :  ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(name,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Mobile: ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(mobile,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Email :  ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(email,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Acc no: ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(account,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Ifsc no: ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(ifsc,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Balance: ",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                  Flexible(
                    child: Text(balance,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
