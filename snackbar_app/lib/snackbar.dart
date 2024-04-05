import 'package:flutter/material.dart';

class Mysnackbar extends StatelessWidget {
  const Mysnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => snackBarFunction(context, Colors.red),
      child: const Text('Snackbar button'),
      ),
    );
  }
  
    // -- Functions --
  snackBarFunction(BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: const Text('Elevated Button is clicked'),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    ));
  }
}