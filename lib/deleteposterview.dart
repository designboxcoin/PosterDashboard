// import 'package:flutter/material.dart';

// class DeletePosterScreen extends StatefulWidget {
//   const DeletePosterScreen({Key? key}) : super(key: key);

//   @override
//   _DeletePosterScreenState createState() => _DeletePosterScreenState();
// }

// class _DeletePosterScreenState extends State<DeletePosterScreen> {
//   final TextEditingController _postIdController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Delete Poster'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _postIdController,
//               decoration: const InputDecoration(
//                 labelText: 'Post ID',
//                 hintText: 'Enter post ID to delete',
//               ),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   _deletePoster();
//                 },
//                 child: const Text('Delete Poster'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _deletePoster() async {
//     final postId = _postIdController.text.trim();
//     if (postId.isNotEmpty) {
//       // Call your delete service here passing the postId
//       // For example:
//       await deleteService.deletePoster(postId);
//       print('Deleting poster with ID: $postId');
//     } else {
//       // Show an error message if the post ID is empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a post ID')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _postIdController.dispose();
//     super.dispose();
//   }
// }
