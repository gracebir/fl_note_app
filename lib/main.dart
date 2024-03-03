import 'package:fl_note_app/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

// https://community.distributed.com/networks/events/122492
// https://medium.com/codebrew/offline-first-approach-with-flutter-ace2843d36d8
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Poppins"),
        home: const DashBoardPage());
  }
}
