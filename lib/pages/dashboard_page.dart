import 'package:fl_note_app/components/app_nav.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AppNav(),
          const SizedBox(
            height: 20,
          ),
          ListView(
            children: [],
          ),
        ],
      ),
    ));
  }
}
