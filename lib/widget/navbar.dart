// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Manu"),
            accountEmail: const Text("manuahirwar124@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () => showSecondImage(context),
              child: Hero(
                tag: 'my-hero-tag',
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'images/avatar.jpg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  image: AssetImage('images/backavatar.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(
              Icons.insert_link_outlined,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Follow me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(
                  'https://instagram.com/manu__ahirwar7?igshid=ZDdkNTZiNTM=');
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Share',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () async {
              final result = await Share.shareWithResult(
                  'check out my website https://example.com',
                  subject: 'Flutter learning app');
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('share result=${result.status}')));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.code_outlined,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Source code',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse('https://github.com/manuAhir7');
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bug_report_outlined,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Report a bug',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(
                  'https://github.com/manuAhir7/mausam_weatherapp/issues/new');
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              Fluttertoast.showToast(
                msg: "This is demo setting option",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black.withOpacity(0.5),
                textColor: Colors.white,
                fontSize: 14.0,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('Policies',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              final Uri url1 = Uri.parse(
                  'https://github.com/manuAhir7/mausam_weatherapp#mausam');
              launchUrl(url1, mode: LaunchMode.platformDefault);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.green,
              size: 30,
            ),
            title: const Text('About app',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      elevation: 4,
                      title: Text("Readme.md",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      content: Text(
                        "SparkBank is a Flutter project that allows users to transfer money between each other and keep track of their transaction history. "
                        "The app is designed to provide a seamless user experience and make it easy for users to manage their finances.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.green,
              size: 30,
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

void showSecondImage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
            backgroundColor: Colors.black38,
            appBar: AppBar(title: const Text("User Image"), backgroundColor: Colors.black,),
            body: Center(
              child: Hero(
                tag: 'my-hero-tag',
                child: Image.asset('images/avatar.jpg'),
              ),
            ),
          )));
}
