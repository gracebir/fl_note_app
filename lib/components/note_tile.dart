import 'package:fl_note_app/models/note.dart';
import 'package:fl_note_app/pages/note_editor.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final bool isSync;
  final String? content;
  NoteTile(
      {super.key, required this.title, required this.isSync, this.content});

  @override
  Widget build(BuildContext context) {
    Note? note;
    if (title != null && content != null) {
      note = Note(title: title, content: content!);
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteEditor(
                      note: note,
                    )));
      },
      child: Container(
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
      ),
    );
  }
}
