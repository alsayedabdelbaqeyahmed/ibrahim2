import 'package:flutter/material.dart';
import 'package:rawaa/screens/home_screen.dart';
import 'package:rawaa/widgets/build_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen({Key? key, required this.url}) : super(key: key);

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => WebViewScreen(
                        url: 'https://rawaaclothes.com/search/',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.home),
              ),
              Image.asset(
                'assets/rawaa-logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(),
            ],
          ),
          centerTitle: true,
        ),
        endDrawer: BuildDrawer(),
        body: Center(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              controller = controller;
            },
          ),
        ),
      ),
    );
  }
}
