class Comment {
  final String username;
  final String text;
  final String timeAgo;

  Comment({
    required this.username,
    required this.text,
    required this.timeAgo,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['username'],
      text: json['content'],
      timeAgo: json['createdAt'],
    );
  }
}
