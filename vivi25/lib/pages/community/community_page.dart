import 'package:flutter/material.dart';

class Post {
  final String id;
  final String author;
  final String avatarUrl;
  final String content;
  final DateTime date;
  final int likes;
  final int comments;
  final String? imageUrl;

  Post({
    required this.id,
    required this.author,
    required this.avatarUrl,
    required this.content,
    required this.date,
    this.likes = 0,
    this.comments = 0,
    this.imageUrl,
  });
}

class CommunityPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      id: '1',
      author: 'LegalEagle',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      content:
          'Just discovered this amazing feature in our app that automatically summarizes complex legal documents! Has anyone else tried it?',
      date: DateTime.now().subtract(Duration(hours: 2)),
      likes: 24,
      comments: 8,
      imageUrl: 'https://source.unsplash.com/random/600x300/?law',
    ),
    Post(
      id: '2',
      author: 'ParalegalPro',
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
      content:
          'Sharing a tip: When uploading documents, make sure they\'re in PDF format for best results. The OCR works perfectly with clear scans!',
      date: DateTime.now().subtract(Duration(days: 1)),
      likes: 42,
      comments: 15,
    ),
    Post(
      id: '3',
      author: 'LawStudent101',
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      content:
          'This app saved me hours of contract review time today. The AI analysis pointed out several clauses I would have missed!',
      date: DateTime.now().subtract(Duration(days: 3)),
      likes: 56,
      comments: 23,
      imageUrl: 'https://source.unsplash.com/random/600x300/?contract',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Community'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add new post functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPostCard(posts[index]);
        },
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.avatarUrl),
                  radius: 20,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${post.date.day}/${post.date.month}/${post.date.year}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(post.content),
            if (post.imageUrl != null) ...[
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  post.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                Text(post.likes.toString()),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {},
                ),
                Text(post.comments.toString()),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
