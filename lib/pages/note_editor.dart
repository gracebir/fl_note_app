import 'package:fl_note_app/models/note.dart';
import 'package:fl_note_app/services/database_helper.dart';
import 'package:flutter/material.dart';

class NoteEditor extends StatelessWidget {
  final Note? note;
  final Function()? onNoteAdded;
  NoteEditor({super.key, this.note, this.onNoteAdded});

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final content = TextEditingController();
    if (note != null) {
      title.text = note!.title;
      content.text = note!.content;
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
                            onTap: () async {},
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
                      onTap: () async {
                        final titleValue = title.value.text;
                        final contentValue = content.value.text;
                        if (titleValue.isEmpty || contentValue.isEmpty) {
                          return;
                        }
                        final Note model = Note(
                            title: titleValue,
                            content: contentValue,
                            noteID: note?.noteID,
                            syncStatus: "Unsynced",
                            version: 1,
                            isDeleted: 0);

                        if (note == null) {
                          await DatabaseHelper.addNote(model);
                          print("======================??????=========");
                        } else {
                          await DatabaseHelper.updateNote(model);
                        }
                        title.clear();
                        content.clear();
                        final currentContext = context;
                        Navigator.pop(currentContext);
                      },
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
                  controller: title,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3B3B3B))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: content,
                  maxLines: 5,
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
