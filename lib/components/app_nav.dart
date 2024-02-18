import 'package:flutter/material.dart';

class AppNav extends StatelessWidget {
  const AppNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "lib/assets/logo.png",
                width: 52,
                height: 52,
              ),
              const SizedBox(
                width: 8,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Elastic Team",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF007A),
                          fontSize: 18)),
                  Text("Notes App",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18))
                ],
              ),
            ],
          ),
          Image.asset(
            "lib/assets/wi-fi-off.png",
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
