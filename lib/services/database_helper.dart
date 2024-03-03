import 'package:fl_note_app/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "Notedb.db";

  static Future<Database> _initialDB() async {
    String path = await getDatabasesPath();

    return openDatabase(join(path, _dbName),
        onCreate: (db, version) async => await db.execute("""
CREATE TABLE notes (
  noteID INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL ,
  content TEXT NOT NULL,
  syncStatus TEXT,
  version INTEGER,
  isDeleted INTEGER
)
"""), version: _version);
  }

  static Future<int> addNote(Note note) async {
    final db = await _initialDB();
    return await db.insert("Note", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateNote(Note note) async {
    final db = await _initialDB();
    return await db.update("Note", note.toJson(),
        where: 'noteID = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteNote(Note note) async {
    final db = await _initialDB();
    return await db.delete(
      "Note",
      where: 'noteID = ?',
      whereArgs: [note.id],
    );
  }

  static Future<List<Note>?> getAllNotes() async {
    final db = await _initialDB();
    final List<Map<String, dynamic>> maps =
        await db.query("Note", orderBy: "noteID");
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}
