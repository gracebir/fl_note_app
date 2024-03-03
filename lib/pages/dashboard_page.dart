import 'package:fl_note_app/components/app_nav.dart';
import 'package:fl_note_app/components/note_tile.dart';
import 'package:fl_note_app/pages/note_editor.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppNav(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                children: [
                  NoteTile(
                      title: "Digital Marketing",
                      content:
                          """The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two.Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines.If you know the basics of design better than anyone else, you can apply them flawlessly anywhere""",
                      isSync: true),
                  NoteTile(
                      title:
                          "Book Review: The Design of Everyday Things by Don Norman",
                      content:
                          """The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two. Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines. If you know the basics of design better than anyone else, you can apply them flawlessly anywhere.""",
                      isSync: false),
                  NoteTile(
                      title: "Good Design while Going Green",
                      content:
                          """The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two. Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines.""",
                      isSync: true),
                  NoteTile(
                      title: "Life Size Gaming Simulator",
                      content:
                          """The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two. Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines.""",
                      isSync: true),
                  NoteTile(
                      title: "The most dangerous is comfort",
                      content:
                          """The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two.If you know the basics of design better than anyone else, you can apply them flawlessly anywhere.""",
                      isSync: true),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteEditor()));
        },
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffFF007A)),
          child: Image.asset(
            "lib/assets/plus.png",
            height: 28,
            width: 28,
          ),
        ),
      ),
    );
  }
}
