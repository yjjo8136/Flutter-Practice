class Todo {
  String id;
  final String title;
  final String content;
  final DateTime uploadDate;

  Todo({
    this.id = '',
    required this.title,
    required this.content,
    required this.uploadDate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'uploadDate': uploadDate,
      };

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        uploadDate: json['uploadDate'].toDate(),
      );
}
