import 'package:vivi25/pages/community/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onCommentPressed;

  const PostCard({
    required this.post,
    required this.onCommentPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with user info
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(post.userImage),
            ),
            title: Text(post.username,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(timeago.format(post.timePosted)),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),

          // Media content
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              post.imageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // Action buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                SizedBox(width: 4),
                Text(post.likes.toString()),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.comment_outlined),
                  onPressed: onCommentPressed,
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(post.description),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
