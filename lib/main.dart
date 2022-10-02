import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Stream<int> counterNumber() async* {
    for (var i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: Test
    debugPrint('Di rebuild ulang');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Builder'),
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        body: Center(
          child: StreamBuilder(
            stream: counterNumber(),
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ),
      ),
    );
  }
}
