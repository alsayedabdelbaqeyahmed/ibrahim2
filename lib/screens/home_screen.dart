import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:rawaa/screens/web_view_screen.dart';
import 'package:rawaa/widgets/build_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? webViewController;
  bool _isLoading = true;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse('https://rawaaclothes.com/')),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  // Customize your WebView options here
                  ),
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                _isLoading = true;
              });
            },
            onLoadStop: (controller, url) {
              setState(() {
                _isLoading = false;
              });

              // Inject JavaScript code to import an external CSS file.
              controller.evaluateJavascript(
                source: """
                  var link = document.createElement('link');
                  link.rel = 'stylesheet';
                  link.href = 'https://cdn3.olvtec.com/matjar/webview.css'; // Replace with your CSS file URL
                  document.head.appendChild(link);
                """,
              );
            },
            onProgressChanged: (controller, progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (!_isLoading && _progress != 1.0)
            LinearProgressIndicator(
              value: _progress,
            ),
        ],
      ),
    );
  }
}
