
import 'package:flutter/material.dart';
import 'package:sparkbank/database/bankdb.dart';
import 'package:sparkbank/model/usermodel.dart';
import 'package:sparkbank/widget/userwidget.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<Info> userList = [];

  Future<void> _loadUsers() async {
    final users = await Sparkbank.instance.readAllInfo();
    setState(() {
      userList = users;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 5.0,
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/entry');
        },
      ),
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/history');
            },
            icon: const Icon(Icons.receipt_long_sharp),
            iconSize: 26,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: userList.isEmpty
            ? const Center(
          child: Text(
            'No Customer Present',
            style: TextStyle(color: Colors.green, fontSize: 20.0),
          ),
        )
            : ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Userbar(
              user: userList[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}














//     ListView.builder(
//         itemCount: usersCollection.length,
//         itemBuilder: (context, index) {
//           return everyUserGeneralInformation(index);
//         },
//       )

// Row(
// children: [
// Expanded(
// child: GestureDetector(
// onTap: () {
// Navigator.pushNamed(
// context,
// '/data',
// arguments: <String, dynamic>{
// // 'id': userList[0].id,
// // 'name': userList[0].name,
// // 'mobile': userList[0].phonenumber.toString(),
// // 'email': userList[0].email,
// // 'account': userList[0].account.toString(),
// // 'balance': userList[0].balance.toString(),
// // 'ifsc': userList[0].ifsc,
// },
// );
// },
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(14),
// color: Colors.green.withOpacity(0.5),
// ),
// margin: const EdgeInsets.symmetric(
// horizontal: 20, vertical: 10),
// padding: const EdgeInsets.all(10),
// child: Row(
// children: [
// const CircleAvatar(
// radius: 30,
// backgroundImage:
// AssetImage('images/avatar.jpg'),
// ),
// const SizedBox(width: 14),
// Column(
// children: [
// const SizedBox(
// width: 140,
// child: Text("Manu ahirwar",
// overflow: TextOverflow.visible,
// style: TextStyle(
// fontWeight: FontWeight.w600,
// fontSize: 16)),
// ),
// const SizedBox(height: 5),
// SizedBox(
// width: 140,
// child: Row(
// children: const [
// Icon(
// Icons.account_balance,
// size: 14,
// ),
// SizedBox(width: 4),
// Text("xxxxxxxx"),
// Text(
// "3446",
// style: TextStyle(
// fontWeight: FontWeight.w400),
// )
// ],
// ),
// ),
// ],
// ),
// SizedBox(
// width: 85,
// height: 40,
// child: Row(
// children: const [
// Text("Rs. ", style: TextStyle(
// fontWeight: FontWeight.w600,
// )),
// Text("5005655",
// style: TextStyle(
// fontWeight: FontWeight.w600,
// )),
// ],
// ),
// )
// ],
// ),
// ),
// ),
// ),
// ],
// ),
