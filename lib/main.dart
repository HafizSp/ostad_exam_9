import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedSize = '';

  void _showSnackbar(BuildContext context, String size) {
    final snackBar = SnackBar(
      content: Text('Selected Size: $size'),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _changeButtonColor(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  Widget _buildButton(BuildContext context, String size) {
    return SizedBox(
      width: 92,
      child: ElevatedButton(
        onPressed: () {
          _changeButtonColor(size);
          _showSnackbar(context, size);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            size == selectedSize ? Colors.green : Colors.blue,
          ),
        ),
        child: Text(size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: _buildButton(context, "S")),
                  const SizedBox(width: 10.0),
                  Expanded(child: _buildButton(context, "M")),
                  const SizedBox(width: 10.0),
                  Expanded(child: _buildButton(context, "L")),
                  const SizedBox(width: 10.0),
                  Expanded(child: _buildButton(context, "XL")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton(context, "XXL"),
                  const SizedBox(width: 10.0),
                  _buildButton(context, "XXXL"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
