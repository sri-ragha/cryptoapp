import 'dart:async';

import 'package:crypto_app/Services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class NewsScreen extends StatefulWidget {
  final String newsNumber;
  const NewsScreen({super.key, required this.newsNumber});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ApiService futurenewscontroller = Get.put(ApiService());

  final Completer<WebViewPlusController> controller =
      Completer<WebViewPlusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPlus(
        initialUrl: widget.newsNumber,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewPlusController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}
