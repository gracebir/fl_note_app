import 'package:fl_note_app/components/app_nav.dart';
import 'package:fl_note_app/components/note_tile.dart';
import 'package:fl_note_app/models/note.dart';
import 'package:fl_note_app/pages/note_editor.dart';
import 'package:fl_note_app/services/database_helper.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<Note>? _notes = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    final data = await DatabaseHelper.getAllNotes();
    setState(() {
      _notes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppNav(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: _notes!.length,
                itemBuilder: (context, index) => NoteTile(
                  title: _notes![index].title,
                  isSync: _notes![index].isSync!,
                  content: _notes![index].content,
                ),
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
