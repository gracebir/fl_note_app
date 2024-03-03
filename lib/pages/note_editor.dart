import 'package:fl_note_app/models/note.dart';
import 'package:flutter/material.dart';

class NoteEditor extends StatelessWidget {
  final Note? note;
  NoteEditor({super.key, this.note});

  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      _title.text = note!.title;
      _content.text = note!.content;
    }
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
                Row(
                  children: [
                    note != null
                        ? GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFF0000),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      width: 15,
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
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _title,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3B3B3B))),
                ),
                TextField(
                  controller: _content,
                  maxLines: 15,
                  decoration: const InputDecoration(
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
