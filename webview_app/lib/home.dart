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
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {
          isLoading =true;
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
      )
    )
    ..loadRequest(Uri.parse("https://$siteName"));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text('webview'),
              Row(
                children: [
                  
                ],
              ),
                ElevatedButton(
                  onPressed: () {
                    siteName = "www.naver.com";
                    reloadSite();
                  },
                   child: const Text('Naver'),
                   ),
                   
            ],),
        )
      ),
      body: Stack(
        children: [
          isLoading ? 
          const Center(
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
// Function ----------
  backProcess() async {
    if(await controller.canGoBack()) {
      controller.goBack();
    }else {
      snackBarFunction();
    }
  }

  snackBarFunction() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No more to go'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
              )
          );
  }

  reloadSite() {
  
    controller.loadRequest(Uri.parse("https://$siteName"));
  }
}