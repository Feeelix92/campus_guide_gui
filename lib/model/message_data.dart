class MessageData {
  final String? id;
  final String? title;
  final String? text;
  final String? teaser;
  final String? author;
  final String? owner;
  final String? created;
  final String? lastChanged;
  final List<dynamic>? tags;
  final List<dynamic>? reciever;

  const MessageData({
    required this.id,
    required this.title,
    required this.text,
    required this.teaser,
    required this.author,
    required this.owner,
    required this.created,
    required this.lastChanged,
    required this.tags,
    required this.reciever
  });

  factory MessageData.fromJSON(Map<String, dynamic> json) {
    return MessageData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      teaser: json['teaser'] as String?,
      author: json['author'] as String?,
      owner: json['owner'] as String?,
      created: json['created'] as String?,
      lastChanged: json['lastChanged'] as String?,
      tags: json['tags'] as List<dynamic>?,
      reciever: json['reciever'] as List<dynamic>?,
    );
  }
}