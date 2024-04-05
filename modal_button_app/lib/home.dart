import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('modal button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => showType1ButtonSheet(),
                child: const Text('Rectangle')),
            ElevatedButton(
                onPressed: () => showType2ButtonSheet(),
                child: const Text('Round')),
            ElevatedButton(
                onPressed: () => showGet1ButtonSheet(),
                child: const Text('GetX : Rectangle')),
            ElevatedButton(
                onPressed: () => showGet2ButtonSheet(),
                child: const Text('GetX : Round')),
          ],
        ),
      ),
    );
  }

  showType1ButtonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type #1 Bottom Sheet'),
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Close'))
              ],
            ),
          ),
        );
      },
    );
  }

  showType2ButtonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type #2 Bottom Sheet'),
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Close'))
              ],
            ),
          ),
        );
      },
    );
  }

  showGet1ButtonSheet() {
    Get.bottomSheet(Container(
      height: 200,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Type #1 GetXBottom Sheet'),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Close'))
          ],
        ),
      ),
    ));
  }

  showGet2ButtonSheet() {
    Get.bottomSheet(Container(
      height: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Type #2 GetX Bottom Sheet'),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Close'))
          ],
        ),
      ),
    ));
  }
}
