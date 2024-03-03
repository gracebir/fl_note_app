class Note {
  final int? noteID;
  final String title;
  final String content;
  final String? syncStatus;
  final int? version;
  final int? isDeleted;

  Note(
      {this.noteID,
      required this.title,
      required this.content,
      this.syncStatus,
      this.version,
      this.isDeleted});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      title: json['title'],
      content: json['content'],
      noteID: json['noteID'],
      syncStatus: json['syncStatus'],
      version: json['version'],
      isDeleted: json['isDeleted']);

  Map<String, dynamic> toJson() => {
        'noteID': noteID,
        'title': title,
        'content': content,
        'syncStatus': syncStatus,
        'version': version,
        'isDeleted': isDeleted
      };
}
