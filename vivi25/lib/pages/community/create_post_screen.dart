// import 'package:farmfusion/services/api_service.dart';
// import 'package:flutter/material.dart';

// class CreatePostScreen extends StatefulWidget {
//   final Function()? onPostCreated;

//   const CreatePostScreen({Key? key, this.onPostCreated}) : super(key: key);

//   @override
//   _CreatePostScreenState createState() => _CreatePostScreenState();
// }

// class _CreatePostScreenState extends State<CreatePostScreen> {
//   final TextEditingController _descriptionController = TextEditingController();
//   String _imageUrl = '';
//   bool _isPosting = false;

//   Future<void> _createPost() async {
//     if (_descriptionController.text.isEmpty) return;

//     setState(() => _isPosting = true);

//     try {
//       // Replace with actual user ID from your auth system
//       final userId = 1;

//       await ApiService.createPost(
//         description: _descriptionController.text,
//         imageUrl: _imageUrl,
//         userId: userId,
//       );

//       if (widget.onPostCreated != null) {
//         widget.onPostCreated!();
//       }

//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to create post: $e')),
//       );
//     } finally {
//       setState(() => _isPosting = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//         leading: IconButton(
//           icon: Icon(Icons.close),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: _descriptionController,
//                       decoration: InputDecoration(
//                         hintText: "What's happening in your farm?",
//                         border: InputBorder.none,
//                       ),
//                       maxLines: null,
//                     ),
//                     if (_imageUrl.isNotEmpty)
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8.0),
//                           child: Image.network(
//                             _imageUrl,
//                             width: double.infinity,
//                             height: 200,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             Divider(),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.camera_alt),
//                   onPressed: () {
//                     // Implement image picker functionality
//                     // setState(() => _imageUrl = 'selected_image_url');
//                   },
//                 ),
//                 Spacer(),
//                 ElevatedButton(
//                   onPressed: _isPosting ? null : _createPost,
//                   child: _isPosting
//                       ? CircularProgressIndicator(color: Colors.white)
//                       : Text('Post'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }
