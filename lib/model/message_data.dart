class MessageData {
  final String? id;
  final String? title;
  final String? text;
  final String? author;
  final String? created;
  final String? lastChanged;
  final List<String>? tags;

  const MessageData({
    required this.id,
    required this.title,
    required this.text,
    required this.author,
    required this.created,
    required this.lastChanged,
    required this.tags
  });

  factory MessageData.fromJSON(Map<String, dynamic> json) {
    return MessageData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      author: json['author'] as String?,
      created: json['created'] as String?,
      lastChanged: json['lastChanged'] as String?,
      tags: json['tags'] as List<String>?,
    );
  }
}