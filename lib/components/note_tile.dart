import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final bool isSync;
  NoteTile({super.key, required this.title, required this.isSync});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffFDFFB6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          isSync
              ? Image.asset(
                  "lib/assets/sync.png",
                  height: 20,
                )
              : Image.asset(
                  "lib/assets/no-sync.png",
                  height: 20,
                )
        ],
      ),
    );
  }
}
