// import 'package:flutter/material.dart';
// import 'package:dashboard/service.dart';

// class StatePosterScreen extends StatelessWidget {
//   final String? stateName;
//   final PosterService posterService = PosterService();

//   StatePosterScreen({required this.stateName});

//   @override
//   Widget build(BuildContext context) {
//     final double posterSize =
//         MediaQuery.of(context).size.width * 0.6; // Reduce by 40%

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$stateName Posters'),
//       ),
//       body: FutureBuilder(
//         future: posterService.fetchPosters('BJP', stateName!),
//         builder: (context, AsyncSnapshot<List<String>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final List<String> posterUrls = snapshot.data!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 6,
//                 childAspectRatio: 1, // Aspect ratio 1:1
//               ),
//               itemCount: posterUrls.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: posterSize,
//                     height: posterSize,
//                     child: Image.network(
//                       posterUrls[index],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:dashboard/service.dart';

// class StatePosterScreen extends StatelessWidget {
//   final String? stateName;
//   final PosterService posterService = PosterService();

//   StatePosterScreen({required this.stateName});

//   @override
//   Widget build(BuildContext context) {
//     final double posterSize =
//         MediaQuery.of(context).size.width * 0.4; // Reduce by 40%

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$stateName Posters'),
//       ),
//       body: FutureBuilder(
//         future: posterService.fetchPosters('BJP', stateName!),
//         builder: (context, AsyncSnapshot<Map<String, List<String>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final Map<String, List<String>> posterData = snapshot.data!;
//             final List<String> posterUrls = posterData['posterUrls']!;
//             final List<String> postIds = posterData['postIds']!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1, // Aspect ratio 1:1
//               ),
//               itemCount: posterUrls.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: posterSize,
//                         height: posterSize,
//                         child: Image.network(
//                           posterUrls[index],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           try {
//                             await posterService.deletePoster(postIds[index]);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Poster deleted successfully'),
//                               ),
//                             );
//                           } catch (e) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Failed to delete poster'),
//                               ),
//                             );
//                           }
//                         },
//                         child: const Text('Delete Poster'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:dashboard/service.dart';

// class StatePosterScreen extends StatelessWidget {
//   final String? stateName;
//   final PosterService posterService = PosterService();

//   StatePosterScreen({required this.stateName});

//   @override
//   Widget build(BuildContext context) {
//     final double posterSize =
//         MediaQuery.of(context).size.width * 0.4; // Reduce by 40%

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$stateName Posters'),
//       ),
//       body: FutureBuilder(
//         future: posterService.fetchPosters('BJP', stateName!),
//         builder: (context, AsyncSnapshot<Map<String, List<String>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final Map<String, List<String>> posterData = snapshot.data!;
//             final List<String> posterUrls = posterData['posterUrls']!;
//             final List<String> postIds = posterData['postIds']!;
//             return ReorderableListView(
//               padding: const EdgeInsets.all(8.0),
//               onReorder: (oldIndex, newIndex) async {
//                 // Update the order of postIds
//                 final draggedId = postIds.removeAt(oldIndex);
//                 postIds.insert(
//                     newIndex > oldIndex ? newIndex - 1 : newIndex, draggedId);
//                 // Reorder posters
//                 try {
//                   await posterService.reorderPosters(postIds);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Posters reordered successfully'),
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Failed to reorder posters'),
//                     ),
//                   );
//                 }
//               },
//               children: List.generate(posterUrls.length, (index) {
//                 return ListTile(
//                   key: Key(postIds[index]),
//                   leading: SizedBox(
//                     width: posterSize,
//                     height: posterSize,
//                     child: Image.network(
//                       posterUrls[index],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   title: Text('Poster ${index + 1}'),
//                 );
//               }),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:dashboard/service.dart';

// class StatePosterScreen extends StatelessWidget {
//   final String? stateName;
//   final PosterService posterService = PosterService();

//   StatePosterScreen({required this.stateName});

//   @override
//   Widget build(BuildContext context) {
//     final double posterSizewidht = MediaQuery.of(context).size.width * 0.9 / 3;
//     final double posterSizeheight = MediaQuery.of(context).size.width * 0.2;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$stateName Posters'),
//       ),
//       body: FutureBuilder(
//         future: posterService.fetchPosters('BJP', stateName!),
//         builder: (context, AsyncSnapshot<Map<String, List<String>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final Map<String, List<String>> posterData = snapshot.data!;
//             final List<String> posterUrls = posterData['posterUrls']!;
//             final List<String> postIds = posterData['postIds']!;

//             return ReorderableListView(
//               padding: const EdgeInsets.all(8.0),
//               onReorder: (oldIndex, newIndex) async {
//                 // Update the order of postIds
//                 final draggedId = postIds.removeAt(oldIndex);
//                 postIds.insert(
//                     newIndex > oldIndex ? newIndex - 1 : newIndex, draggedId);
//                 // Reorder posters
//                 try {
//                   await posterService.reorderPosters(postIds);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Posters reordered successfully'),
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Failed to reorder posters'),
//                     ),
//                   );
//                 }
//               },
//               children: List.generate(posterUrls.length, (index) {
//                 return _buildPosterCard(
//                     context, posterUrls[index], postIds[index]);
//               }),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildPosterCard(
//       BuildContext context, String imageUrl, String postId) {
//     return GestureDetector(
//       onTap: () async {
//         final confirmed = await _showDeleteConfirmationDialog(context);
//         if (confirmed) {
//           try {
//             await posterService.deletePoster(postId);
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Poster deleted successfully'),
//               ),
//             );
//           } catch (e) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Failed to delete poster'),
//               ),
//             );
//           }
//         }
//       },
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.9 / 3,
//         height: MediaQuery.of(context).size.width * 0.3,
//         child: Card(
//           elevation: 3,
//           child: Stack(
//             children: [
//               Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//               Positioned(
//                 top: 8,
//                 left: 8,
//                 child: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () async {
//                     final confirmed =
//                         await _showDeleteConfirmationDialog(context);
//                     if (confirmed) {
//                       try {
//                         await posterService.deletePoster(postId);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Poster deleted successfully'),
//                           ),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Failed to delete poster'),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
//     return await showDialog<bool>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Delete Poster'),
//               content:
//                   const Text('Are you sure you want to delete this poster?'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   child: const Text('Cancel'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: const Text('Delete'),
//                 ),
//               ],
//             );
//           },
//         ) ??
//         false;
//   }
// }

import 'package:flutter/material.dart';
import 'package:dashboard/service.dart';

class StatePosterScreen extends StatefulWidget {
  final String? stateName;
  final PosterService posterService = PosterService();

  StatePosterScreen({required this.stateName});

  @override
  _StatePosterScreenState createState() => _StatePosterScreenState();
}

class _StatePosterScreenState extends State<StatePosterScreen> {
  late List<String> posterUrls;
  late List<String> postIds;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final posterData =
        await widget.posterService.fetchPosters('BJP', widget.stateName!);
    setState(() {
      posterUrls = posterData['posterUrls']!;
      postIds = posterData['postIds']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.stateName} Posters'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: posterUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _deletePoster(postIds[index]),
            child: DragTarget<String>(
              onWillAccept: (data) => true,
              onAccept: (data) {
                final draggedIndex = postIds.indexOf(data);
                final targetIndex = index;
                if (draggedIndex != targetIndex) {
                  setState(() {
                    final draggedId = postIds.removeAt(draggedIndex);
                    postIds.insert(targetIndex, draggedId);
                  });
                  reorderPosters();
                }
              },
              builder: (context, candidateData, rejectedData) {
                return Draggable<String>(
                  data: postIds[index],
                  feedback: SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      posterUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      posterUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  childWhenDragging: Container(),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> reorderPosters() async {
    try {
      await widget.posterService.reorderPosters(postIds);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Posters reordered successfully'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to reorder posters'),
        ),
      );
    }
  }

  Future<void> _deletePoster(String postId) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Poster'),
        content: Text('Are you sure you want to delete this poster?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await widget.posterService.deletePoster(postId);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Poster deleted successfully'),
                  ),
                );
                fetchData(); // Fetch data again to update the view
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to delete poster'),
                  ),
                );
              }
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
