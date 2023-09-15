import 'package:flutter/material.dart';
import 'package:rawaa/screens/web_view_screen.dart';

class BuildDrawer extends StatelessWidget {
  BuildDrawer({super.key});
  // final User? user = authInstance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                // color: Colors.cyan,
                ),
            child: Center(
              child: Image.asset(
                'assets/rawaa-logo.png',
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            leading: const Icon(Icons.info),
            title: const Text('سياسة الإستخدام'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => WebViewScreen(
                    url: 'https://rawaaclothes.com/terms/',
                  ),
                ),
              );
            },
          ),
          ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            leading: const Icon(Icons.info),
            title: const Text('سياسة الخصوصية '),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => WebViewScreen(
                    url: 'https://rawaaclothes.com/privacy/',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
