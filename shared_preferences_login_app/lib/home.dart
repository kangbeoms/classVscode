import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    initSharePrefeerences();
  }

  initSharePrefeerences() async {
    final prefs = await SharedPreferences.getInstance();
    userIdController.text = prefs.getString('p_userid') ?? "";
    passwordController.text = prefs.getString('p_userpw') ?? "";
    // 앱을 종료하고 다시 실행하면 SharedPreferences 에 남아있다.
    // 앱 종료시 정리해야한다
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        disposeSharedPreferences();
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  disposeSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: userIdController,
            ),
            TextField(
              controller: passwordController,
            ),
            ElevatedButton(
                onPressed: () {
                  saveSharedPreferences();
                  Get.to(
                    const SecondPage(),
                  );
                },
                child: const Text('Log In')
                )
          ],
        ),
      ),
    );
  }

  saveSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('p_userid', userIdController.text);
    prefs.setString('p_userpw', passwordController.text);
  }
}
