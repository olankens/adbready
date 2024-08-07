import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:adbready/adbready.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _adbPath = '';
  final _adbreadyPlugin = Adbready();

  @override
  void initState() {
    super.initState();
    getAdbPath();
  }

  Future<void> getAdbPath() async {
    String adbPath;
    try {
      adbPath = await _adbreadyPlugin.deploy();
    } on PlatformException {
      adbPath = 'Failed to deploy.';
    }
    if (!mounted) return;
    setState(() {
      _adbPath = adbPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adbready Example'),
        ),
        body: Center(
          child: Text('Adb path: $_adbPath\n'),
        ),
      ),
    );
  }
}
