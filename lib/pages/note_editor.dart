import 'package:flutter/material.dart';

class NoteEditor extends StatelessWidget {
  const NoteEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF007A),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset("lib/assets/back.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff3B3B3B),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset("lib/assets/save.png"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3B3B3B))),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type something...",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff3B3B3B))),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
