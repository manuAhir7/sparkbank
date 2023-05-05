import 'package:flutter/material.dart';
import 'package:sparkbank/model/transactionmodel.dart';

class Transactbar extends StatelessWidget {
  final MyTransaction transaction;

  const Transactbar({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String str1 = "Rs.";
    return Card(
      color: transaction.receiverName == 'cancelled'
          ? Colors.red.withOpacity(0.5)
          : Colors.green.withOpacity(0.5),
      elevation: 4.0,
      semanticContainer: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      child: SizedBox(
        width: double.maxFinite,
        height: 72,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    margin: const EdgeInsets.only(left: 14, right: 10),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 22,
                          child: Icon(
                            Icons.savings_outlined,
                            size: 26,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 3),
                        const SizedBox(
                          width: 134,
                          child: Text(
                            "Received from",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: 19,
                          width: 132,
                          child: Text(
                            transaction.senderName,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                         SizedBox(
                            width: 110,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$str1${transaction.amount}',
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                        const SizedBox(height: 9),
                        Flexible(
                          child: SizedBox(
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 3),
                                child: Text(
                                  transaction.receiverName,
                                  overflow: TextOverflow.visible,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
