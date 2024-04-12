import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticalNews extends StatefulWidget {
  const ArticalNews({super.key, required this.newsUrl});
  final String newsUrl;

  @override
  _ArticalNewsState createState() => _ArticalNewsState();
}

class _ArticalNewsState extends State<ArticalNews> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  bool _isLoadingPage = true;

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('News')),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.newsUrl,
            // Consider if unrestricted Javascript is truly needed
            // javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _completer.complete(controller);
            },
            onPageFinished: (String finish) {
              setState(() => _isLoadingPage = false);
            },
          ),
          if (_isLoadingPage)
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.yellow,
              ),
            ),
        ],
      ),
    );
  }
}
