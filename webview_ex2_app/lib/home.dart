import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller;
  late TextEditingController textEditingController;
  late bool isLoading;
  late String siteName;
  late String text;

  @override
  void initState() {
    super.initState();

    isLoading = true;
    siteName = 'www.daum.net';
    text = '';
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          isLoading = true;
          setState(() {});
        },
        onPageStarted: (url) {
          isLoading = true;
          setState(() {});
        },
        onPageFinished: (url) {
          isLoading = false;
          setState(() {});
        },
        onWebResourceError: (error) {
          isLoading = false;
          setState(() {});
        },
      ))
      ..loadRequest(Uri.parse("https://$siteName"));

    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: '사이트 이름을 입력하세요.',
              //border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => goSite(), icon: const Icon(Icons.check_sharp))
        ],
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Stack(),
          WebViewWidget(controller: controller)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_back),
        onPressed: () => backProcess(),
      ),
    );
  }

  backProcess() async {
    if (await controller.canGoBack()) {
      controller.goBack();
    } else {
      snackBarFunction();
    }
  }

  snackBarFunction() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('No more to go'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  reloadSite() {
    controller.loadRequest(Uri.parse("https://$siteName"));
  }

  goSite() {
    text = textEditingController.text;
    siteName = text;
    
    reloadSite();
  }
}
