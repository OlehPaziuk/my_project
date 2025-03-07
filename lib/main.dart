import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Лабораторна Робота 1 Олег Пазюк'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();

  void _handleInput() {
    final input = _controller.text.trim().toLowerCase();

    if (input == 'clear') {
      setState(() {
        _counter = 0;
      });
    } else if (input == 'exit') {
      // Закриваємо додаток
      Navigator.of(context).pop();
    } else {
      final int? value = int.tryParse(input);
      if (value != null) {
        setState(() {
          _counter += value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Введіть число або команду:',
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Число або команда',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Лічильник: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleInput,
              child: const Text('Виконати'),
            ),
          ],
        ),
      ),
    );
  }
}
