class Note {
  final int? id;
  final String title;
  final String content;
  final String? isSync;

  Note({this.id, required this.title, required this.content, this.isSync});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      title: json['title'],
      content: json['content'],
      id: json['id'],
      isSync: json['isSync']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content, 'isSync': isSync};
}
