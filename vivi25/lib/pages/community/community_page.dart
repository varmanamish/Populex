import 'package:vivi25/pages/community/components/comments_bottom_sheet.dart';
import 'package:vivi25/pages/community/components/post_card.dart';
import 'package:vivi25/pages/community/create_post_screen.dart';
import 'package:vivi25/pages/community/models/comments.dart';
import 'package:vivi25/pages/community/models/posts.dart';
import 'package:vivi25/api_service.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<Post> posts = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final fetchedPosts = await ApiService.fetchPosts();
      setState(() {
        posts = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load posts. Please try again.';
        isLoading = false;
      });
      print('Error fetching posts: $e');
    }
  }

  Future<void> _refreshPosts() async {
    await _fetchPosts();
  }

  void _showComments(BuildContext context, Post post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CommentsBottomSheet(post: post);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshPosts,
          ),
        ],
      ),
      body: _buildBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _navigateToCreatePost(context),
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.green, // Farm-themed color
      // ),
    );
  }

  // void _navigateToCreatePost(BuildContext context) {
  //   Navigator.of(context).push(
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) =>
  //           CreatePostScreen(
  //         onPostCreated: _refreshPosts, // Refresh posts after creation
  //       ),
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         const begin = Offset(0.0, 1.0);
  //         const end = Offset.zero;
  //         const curve = Curves.easeInOut;

  //         var tween =
  //             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //         var offsetAnimation = animation.drive(tween);

  //         return SlideTransition(
  //           position: offsetAnimation,
  //           child: child,
  //         );
  //       },
  //       transitionDuration: Duration(milliseconds: 300),
  //     ),
  //   );
  // }

  Widget _buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshPosts,
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (posts.isEmpty) {
      return Center(child: Text('No posts available'));
    }

    return RefreshIndicator(
      onRefresh: _refreshPosts,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(
            post: posts[index],
            onCommentPressed: () => _showComments(context, posts[index]),
          );
        },
      ),
    );
  }
}
