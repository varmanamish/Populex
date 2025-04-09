import 'package:vivi25/pages/community/models/comments.dart';

class Post {
  final int postId;
  final int userId;
  final String username;
  final String userImage;
  final String imageUrl;
  final String description;
  final int likes;
  final List<Comment> comments;
  final DateTime timePosted;

  Post({
    required this.postId,
    required this.userId,
    required this.username,
    required this.userImage,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.comments,
    required this.timePosted,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'] as int,
      userId: json['userId'] as int,
      username: json['username'] as String,
      userImage: json['userImage'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int,
      comments: (json['comments'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      timePosted: DateTime.parse(json['timePosted']),
    );
  }
}
