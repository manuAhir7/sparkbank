import 'package:flutter/material.dart';
import 'package:sparkbank/model/usermodel.dart';
import 'package:sparkbank/database/bankdb.dart';

class Userbar extends StatelessWidget {
  final int index;
  final Info user;

  const Userbar({Key? key, required this.index, required this.user})
      : super(key: key);

  Future<void> deleteuser(int index) async{
    await Sparkbank.instance.deleteInfo(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/data',
          arguments: <String, dynamic>{
            'name': user.name,
            'mobile': user.phonenumber.toString(),
            'email': user.email,
            'account': user.account.toString(),
            'balance': user.balance.toString(),
            'ifsc': user.ifsc,
          },
        );
      },
      child: Card(
        color: Colors.green.withOpacity(0.5),
        elevation: 5.0,
        semanticContainer: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        child: SizedBox(
          width: double.maxFinite,
          height: 70,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 7),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('images/avatar.jpg'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 14),
                      child: Column(
                        children: [
                          // Text('Item $index'),
                          SizedBox(
                            width: 140,
                            height: 20,
                            child: Text(user.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 140,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_balance,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  user.account.toString(),
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "xxxx",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        children: const [
                          Text("Rs."),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 68,
                            child: Text(user.balance.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 11.0),
                     child: SizedBox(
                       width: 38,
                       child: Column(
                         children: [
                           IconButton(onPressed: () async{
                             //await deleteuser(index);
                           }, icon: const Icon(Icons.delete_outline), iconSize: 19)
                         ],
                       ),
                     ),
                   ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
