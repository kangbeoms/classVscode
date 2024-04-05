import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewController controller;
  late bool isLoading;
  late String siteName;

  @override
  void initState() {
    super.initState();

    isLoading = true;
    siteName = 'www.daum.net';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Button webview'),
        toolbarHeight: 100,
        backgroundColor: Colors.amber,
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
      floatingActionButton: SizedBox(
        width: 300,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child:  const Icon(Icons.arrow_back),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                onPressed: () => backProcess(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                child: const Icon(Icons.replay_outlined),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                onPressed: () => re(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.arrow_forward),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
                onPressed: () => forward(),
              ),
            ),
          ],
        ),
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

  re() {
    reloadSite();
  }

  forward() async{
    if( await   controller.canGoForward()) {
          controller.goForward();
    }else {
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
}
