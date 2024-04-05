import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SaveData extends StatefulWidget {
      final String whatSite;
  const SaveData({super.key, required this.whatSite});

  @override
  State<SaveData> createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {


late WebViewController controller;
  late bool isLoading;
 

  @override
  void initState() {
    super.initState();

    isLoading = true;
   
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
      ..loadRequest(Uri.parse("https://${widget.whatSite}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Webview - tabbar'),
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
  
    controller.loadRequest(Uri.parse("https://${widget.whatSite}"));
  }
}