import 'package:flutter/material.dart';
import 'package:sparkbank/widget/navbar.dart';
import 'package:sparkbank/screens/userslist.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Navbar(),
      appBar: AppBar(
        leadingWidth: 70,
        iconTheme: const IconThemeData(color: Colors.green),
        title: Row(
          children: [
            const SizedBox(width: 25),
            Image.asset(
              'images/sparkbank.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Spark Bank",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.greenAccent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset("images/backGround.png",
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => const Users(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          final tween = Tween(begin: begin, end: end);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: curve,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.supervised_user_circle_outlined,
                      size: 18),
                  label: const Text("View User"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'version 1.0',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.withOpacity(0.9)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}