import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsappflutter/screens/dashboard.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() {
  runApp(ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Dashboard(),
    );
  }
}
