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
  late Future<List<Note>?> _notesFuture = Future.value([]);
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    setState(() {
      _notesFuture = DatabaseHelper.getAllNotes();
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
              child: FutureBuilder<List<Note>?>(
                  future: _notesFuture,
                  builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => NoteTile(
                            title: snapshot.data![index].title,
                            isSync: snapshot.data![index].syncStatus!,
                            content: snapshot.data![index].content,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteEditor(
                        onNoteAdded: _refresh,
                      )));
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
