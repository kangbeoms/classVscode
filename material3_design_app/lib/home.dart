import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  final Function(ThemeMode) onChangeTheme;
  const Home({super.key, required this.onChangeTheme});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material3 Design'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiary,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.error,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.errorContainer,
                    alignment: const Alignment(0.0, 0.0),
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.onChangeTheme(ThemeMode.dark);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
                child: const Text('Darck Theme')),
            ElevatedButton(
                onPressed: () {
                  widget.onChangeTheme(ThemeMode.light);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  foregroundColor: Theme.of(context).colorScheme.onTertiary,
                ),
                child: const Text('Darck Theme')),
          ],
        ),
      ),
    );
  }
}
