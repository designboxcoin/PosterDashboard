// // // // import 'package:dashboard/dashboardviewmodel.dart';
// // // // import 'package:flutter/material.dart';

// // // // class DashboardView extends StatefulWidget {
// // // //   const DashboardView({Key? key}) : super(key: key);

// // // //   @override
// // // //   _DashboardViewState createState() => _DashboardViewState();
// // // // }

// // // // class _DashboardViewState extends State<StatefulWidget> {
// // // //   final TextEditingController _partyController = TextEditingController();
// // // //   final TextEditingController _languageController = TextEditingController();
// // // //   final TextEditingController _urlController = TextEditingController();

// // // //   final DashboardViewModel _viewModel = DashboardViewModel();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Poster Dashboard'),
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             TextField(
// // // //               controller: _partyController,
// // // //               decoration: const InputDecoration(
// // // //                 labelText: 'Party',
// // // //                 hintText: 'Enter party name',
// // // //               ),
// // // //             ),
// // // //             TextField(
// // // //               controller: _languageController,
// // // //               decoration: const InputDecoration(
// // // //                 labelText: 'Language',
// // // //                 hintText: 'Enter language',
// // // //               ),
// // // //             ),
// // // //             TextField(
// // // //               controller: _urlController,
// // // //               decoration: const InputDecoration(
// // // //                 labelText: 'Poster URL',
// // // //                 hintText: 'Enter URL of the poster',
// // // //               ),
// // // //             ),
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 _viewModel.uploadPoster(
// // // //                   party: _partyController.text,
// // // //                   language: _languageController.text,
// // // //                   url: _urlController.text,
// // // //                 );
// // // //               },
// // // //               child: const Text('Upload Poster'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _partyController.dispose();
// // // //     _languageController.dispose();
// // // //     _urlController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }
// // // import 'package:dashboard/dashboardviewmodel.dart';
// // // import 'package:flutter/material.dart';

// // // class DashboardView extends StatefulWidget {
// // //   const DashboardView({Key? key}) : super(key: key);

// // //   @override
// // //   _DashboardViewState createState() => _DashboardViewState();
// // // }

// // // class _DashboardViewState extends State<DashboardView> {
// // //   final TextEditingController _partyController = TextEditingController();
// // //   final TextEditingController _languageController = TextEditingController();
// // //   final TextEditingController _urlController = TextEditingController();
// // //   final TextEditingController _postIdController = TextEditingController();

// // //   final DashboardViewModel _viewModel = DashboardViewModel();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Dashboard of Poster for BJP'),
// // //       ),
// // //       body: DefaultTabController(
// // //         length: 3,
// // //         child: Column(
// // //           children: [
// // //             const TabBar(
// // //               tabs: [
// // //                 Tab(text: 'Create Poster'),
// // //                 Tab(text: 'Delete Poster'),
// // //                 Tab(text: 'Fetch Poster'),
// // //               ],
// // //             ),
// // //             Expanded(
// // //               child: TabBarView(
// // //                 children: [
// // //                   _buildCreatePosterTab(),
// // //                   _buildDeletePosterTab(),
// // //                   _buildFetchPosterTab(),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildCreatePosterTab() {
// // //     return Padding(
// // //       padding: const EdgeInsets.all(16.0),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // TextField(
// // //           //   controller: _partyController,
// // //           //   decoration: const InputDecoration(
// // //           //     labelText: 'Party',
// // //           //     hintText: 'Enter party name',
// // //           //   ),
// // //           // ),
// // //           // TextField(
// // //           //   controller: _languageController,
// // //           //   decoration: const InputDecoration(
// // //           //     labelText: 'Language',
// // //           //     hintText: 'Enter language',
// // //           //   ),
// // //           // ),
// // //           TextField(
// // //             controller: _urlController,
// // //             decoration: const InputDecoration(
// // //               labelText: 'Poster URL',
// // //               hintText: 'Enter URL of the poster',
// // //             ),
// // //           ),
// // //           SizedBox(height: 30),
// // //           Center(
// // //             child: ElevatedButton(
// // //               onPressed: () {
// // //                 _viewModel.uploadPoster(
// // //                   party: _partyController.text,
// // //                   language: _languageController.text,
// // //                   // url: _urlController.text,
// // //                 );
// // //               },
// // //               child: const Text('Upload Poster'),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDeletePosterTab() {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Delete Poster'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             TextField(
// // //               controller: _postIdController,
// // //               decoration: const InputDecoration(
// // //                 labelText: 'Post ID',
// // //                 hintText: 'Enter post ID to delete',
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Center(
// // //               child: ElevatedButton(
// // //                 onPressed: () {
// // //                   _viewModel.deletePoster(_postIdController.text);
// // //                 },
// // //                 child: const Text('Delete Poster'),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFetchPosterTab() {
// // //     return Center(
// // //       child: const Text('Fetch Poster Tab'),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _partyController.dispose();
// // //     _languageController.dispose();
// // //     _urlController.dispose();
// // //     _postIdController.dispose();
// // //     super.dispose();
// // //   }
// // // }
// import 'dart:typed_data';
// import 'dart:html' as html;
// import 'package:dashboard/fetchposters.dart';
// import 'package:dashboard/service.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';

// // Import your PosterService class

// class DashboardView extends StatefulWidget {
//   @override
//   _DashboardViewState createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   final _posterService = PosterService();
//   Uint8List? _image;
//   String? _selectedState;
//   String? _selectedStateforimages;
//   String? _imageUrl;

//   Future<void> _uploadImage() async {
//     final result = await ImagePickerWeb.getImageAsBytes();

//     if (result != null) {
//       setState(() {
//         _image = result!;
//       });
//     }
//   }

//   Future<void> _uploadPoster() async {
//     if (_image != null && _selectedState != null) {
//       final imageUrl = await _posterService.uploadImage(_image!);
//       setState(() {
//         _imageUrl = imageUrl;
//       });

//       await _posterService.uploadPoster('BJP', _selectedState!, _imageUrl!);
//       html.window.alert('Poster uploaded successfully');
//     } else {
//       html.window.alert('Please select an image and a state');
//     }
//   }

//   void _navigateToStatePosterScreen(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => StatePosterScreen(
//           stateName: _selectedStateforimages,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: SingleChildScrollView(
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: _uploadImage,
//                   child: Text('Upload Image'),
//                 ),
//                 Container(
//                   width: 200.0,
//                   height: 200.0,
//                   child: _image != null
//                       ? Image.memory(
//                           _image!,
//                           fit: BoxFit.cover,
//                         )
//                       : Placeholder(), // Placeholder widget to show when no image is selected
//                 ),
//                 DropdownButton<String>(
//                   value: _selectedState,
//                   hint: Text('Select State'),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedState = value;
//                     });
//                   },
//                   items: <String>[
//                     'DELHI',
//                     'MAHARASTRA',
//                     'GUJARAT',
//                     'KARNATAKA',
//                     'PUNJAB',
//                     'BIHAR',
//                     'JHARKHAND',
//                     'RAJASTHAN',
//                     'UTTARAKHAND',
//                     'TELANGANA',
//                     'TAMIL',
//                     'HARYANA',
//                     'ANDHRA_PRADESH',
//                     'MADHYA_PRADESH',
//                     'UTTAR_PRADESH',
//                     'HIMACHAL_PRADESH',
//                     'GOA',
//                     'KERALA'
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 ElevatedButton(
//                   onPressed: _uploadPoster,
//                   child: Text('Upload Poster'),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 100,
//             ),
//             Column(
//               children: [
//                 DropdownButton<String>(
//                   value: _selectedStateforimages,
//                   hint: Text('Select State'),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedStateforimages = value;
//                     });
//                   },
//                   items: <String>[
//                     'DELHI',
//                     'MAHARASTRA',
//                     'GUJARAT',
//                     'KARNATAKA',
//                     'PUNJAB',
//                     'BIHAR',
//                     'JHARKHAND',
//                     'RAJASTHAN',
//                     'UTTARAKHAND',
//                     'TELANGANA',
//                     'TAMIL',
//                     'HARYANA',
//                     'ANDHRA_PRADESH',
//                     'MADHYA_PRADESH',
//                     'UTTAR_PRADESH',
//                     'HIMACHAL_PRADESH',
//                     'GOA',
//                     'KERALA'
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _navigateToStatePosterScreen(context),
//                   child: Text('View State Posters'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:typed_data';
// // import 'dart:html' as html;
// // import 'package:dashboard/fetchposters.dart';
// // import 'package:flutter/material.dart';
// // import 'package:dashboard/service.dart';
// // import 'package:image_picker_web/image_picker_web.dart';
// // // Import the StatePosterScreen

// // class DashboardView extends StatefulWidget {
// //   @override
// //   _DashboardViewState createState() => _DashboardViewState();
// // }

// // class _DashboardViewState extends State<DashboardView> {
// //   final _posterService = PosterService();
// //   Uint8List? _image;
// //   String? _selectedState;
// //   String? _imageUrl;

// //   Future<void> _uploadImage() async {
// //     final result = await ImagePickerWeb.getImageAsBytes();

// //     if (result != null) {
// //       setState(() {
// //         _image = result!;
// //       });
// //     }
// //   }

// //   Future<void> _uploadPoster() async {
// //     if (_image != null && _selectedState != null) {
// //       final imageUrl = await _posterService.uploadImage(_image!);
// //       setState(() {
// //         _imageUrl = imageUrl;
// //       });

// //       await _posterService.uploadPoster('BJP', _selectedState!, _imageUrl!);
// //       html.window.alert('Poster uploaded successfully');
// //     } else {
// //       html.window.alert('Please select an image and a state');
// //     }
// //   }

// //   void _navigateToStatePosterScreen(BuildContext context) {
// //     Navigator.of(context).push(
// //       MaterialPageRoute(
// //         builder: (context) => StatePosterScreen(
// //           stateName: _selectedState,
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Dashboard'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             ElevatedButton(
// //               onPressed: _uploadImage,
// //               child: Text('Upload Image'),
// //             ),
// //             Container(
// //               width: 200.0,
// //               height: 200.0,
// //               child: _image != null
// //                   ? Image.memory(
// //                       _image!,
// //                       fit: BoxFit.cover,
// //                     )
// //                   : Placeholder(), // Placeholder widget to show when no image is selected
// //             ),
// //             DropdownButton<String>(
// //               value: _selectedState,
// //               hint: Text('Select State'),
// //               onChanged: (value) {
// //                 setState(() {
// //                   _selectedState = value;
// //                 });
// //               },
// //               items: <String>[
// //                 'DELHI',
// //                 'MAHARASHTRA',
// //                 'GUJARAT',
// //                 'KARNATAKA',
// //                 'PUNJAB',
// //                 'BIHAR',
// //                 'JHARKHAND',
// //                 'RAJASTHAN',
// //                 'UTTARAKHAND',
// //                 'TELANGANA',
// //                 'TAMIL',
// //                 'HARYANA',
// //                 'ANDHRA_PRADESH',
// //                 'MADHYA_PRADESH',
// //                 'UTTAR_PRADESH',
// //                 'HIMACHAL_PRADESH',
// //                 'GOA',
// //                 'KERALA'
// //               ].map((String value) {
// //                 return DropdownMenuItem<String>(
// //                   value: value,
// //                   child: Text(value),
// //                 );
// //               }).toList(),
// //             ),
// //             ElevatedButton(
// //               onPressed: () => _navigateToStatePosterScreen(context),
// //               child: Text('View State Posters'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:dashboard/fetchposters.dart';
import 'package:dashboard/service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Import your PosterService class

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _posterService = PosterService();
  Uint8List? _image;
  String? _selectedState;
  String? _selectedStateforimages;
  String? _imageUrl;
  List<String> _states = [];
  @override
  void initState() {
    super.initState();
    _fetchStates(); // Fetch states when the widget is initialized
  }

  Future<void> _fetchStates() async {
    try {
      final states =
          await _posterService.fetchStates(); // Fetch states from service
      setState(() {
        _states = states; // Update the states list in the state
      });
    } catch (e) {
      print('Failed to fetch states: $e');
    }
  }

  static Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? userId = prefs.getString('userId');

    return {
      'Content-Type': 'application/json',
      'app-user-id': userId ?? '',
      'TOKEN': token ?? '',
      'DEVICE_ID': '567',
      'CLIENT_VERSION': '23',
      'CLIENT_TYPE': 'ANDROID',
      'CLIENT_VERSION_CODE': '75',
    };
  }

  Future<void> _uploadImage() async {
    final result = await ImagePickerWeb.getImageAsBytes();

    if (result != null) {
      setState(() {
        _image = result!;
      });
    }
  }

  Future<void> _uploadPoster() async {
    if (_image != null && _selectedState != null) {
      final imageUrl = await _posterService.uploadImage(_image!);
      setState(() {
        _imageUrl = imageUrl;
      });

      await _posterService.uploadPoster('BJP', _selectedState!, _imageUrl!);
      html.window.alert('Poster uploaded successfully');
    } else {
      html.window.alert('Please select an image and a state');
    }
  }

  void _navigateToStatePosterScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StatePosterScreen(
          stateName: _selectedStateforimages,
        ),
      ),
    );
  }

  void _createAdmin(BuildContext context) async {
    String? username;
    String? password;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Admin'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) => username = value,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (username != null && password != null) {
                  final body = jsonEncode(
                      {'username': username!, 'password': password!});
                  final response = await http.post(
                      Uri.parse(
                          'https://backend.designboxconsuting.com/poster/user/v1/admin'),
                      body: body,
                      headers: await _getHeaders());

                  if (response.statusCode == 200) {
                    Navigator.of(context).pop(); // Close the dialog
                  } else {
                    print('Failed to create admin: ${response.statusCode}');
                  }
                } else {
                  // Show an error message or handle invalid input
                }
              },
              child: Text('Register'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          ElevatedButton(
            onPressed: () => _createAdmin(context), // Change here
            child: Text('Create Admin'), // Provide appropriate child widget
          ),
          // IconButton(
          //   icon: Icon(Icons.person_add),
          //   onPressed: _createAdmin(context),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: _uploadImage,
                  child: Text('Upload Image'),
                ),
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: _image != null
                      ? Image.memory(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : Placeholder(), // Placeholder widget to show when no image is selected
                ),
                DropdownButton<String>(
                  value: _selectedState,
                  hint: Text('Select State'),
                  onChanged: (value) {
                    setState(() {
                      _selectedState = value;
                    });
                  },
                  items: _states.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: _uploadPoster,
                  child: Text('Upload Poster'),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                DropdownButton<String>(
                  value: _selectedStateforimages,
                  hint: Text('Select State'),
                  onChanged: (value) {
                    setState(() {
                      _selectedStateforimages = value;
                    });
                  },
                  items: _states.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () => _navigateToStatePosterScreen(context),
                  child: Text('View State Posters'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
