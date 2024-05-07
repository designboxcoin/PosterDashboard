import 'dart:typed_data';

import 'package:dashboard/service.dart';
import 'package:dashboard/deleteservice.dart';

// class DashboardViewModel {
//   final PosterService _posterService = PosterService();
//   final DeleteService _deleteService = DeleteService();

//   Future<void> uploadPoster({
//     required String party,
//     required String language,
//     required String url,
//   }) async {
//     await _posterService.uploadImage(
//       party: party,
//       language: language, filePath: '',
//       // url: url,
//     );
//   }

//   Future<void> deletePoster(String postId) async {
//     await _deleteService.deletePoster(postId);
//   }

//   // Future<void> posterUpload(String filePath) async {
//   //   await _posterService.uploadImage(filePath);
//   // }
// }

// import 'dart:typed_data';

// import 'package:dashboard/service.dart';
// import 'package:flutter/material.dart';

// class UploadViewModel {
//   final PosterService _posterService = PosterService();

//   Future<void> uploadImageAndCreatePoster({
//     required String party,
//     required String language,
//     required Uint8List bytes,
//   }) async {
//     try {
//       // Upload the image and get the image URL
//       final imageUrl = await _posterService.uploadImage(bytes: bytes);

//       // Create the poster using the image URL
//       await _posterService.uploadPoster(party, language, imageUrl);

//       // If both operations succeed, show a success message
//       print('Image uploaded and poster created successfully');
//     } catch (e) {
//       // Handle any errors that occur during the upload or creation process
//       print('Error: $e');
//     }
//   }
// }

// import 'dart:typed_data';

// import 'package:flutter/material.dart';

// class PosterUploadViewModel extends ChangeNotifier {
//   final PosterService _posterService = PosterService();

//   String _party = '';
//   String _language = '';
//   Uint8List? _imageBytes;

//   set party(String value) {
//     _party = value;
//     notifyListeners();
//   }

//   set language(String value) {
//     _language = value;
//     notifyListeners();
//   }

//   set imageBytes(Uint8List? value) {
//     _imageBytes = value;
//     notifyListeners();
//   }

//   Future<void> uploadPoster() async {
//     if (_party.isEmpty || _language.isEmpty || _imageBytes == null) {
//       // Handle error - All fields must be filled
//       return;
//     }

//     try {
//       final imageUrl = await _posterService.uploadImage(bytes: _imageBytes!);
//       await _posterService.uploadPoster(_party, _language, imageUrl);
//       // Handle success
//     } catch (e) {
//       // Handle error
//       print('Error uploading poster: $e');
//     }
//   }
// }

// class PosterViewModel {
//   final PosterService _posterService = PosterService();
//   late String _imageUrl; // Image URL received from the first endpoint

//   Future<void> uploadImage(Uint8List bytes) async {
//     _imageUrl = await _posterService.uploadImage(bytes: bytes);
//   }

//   Future<void> uploadPoster(String party, String language) async {
//     if (_imageUrl.isEmpty) {
//       throw Exception('Image URL is empty. Upload image first.');
//     }

//     await _posterService.uploadPoster(party, language, _imageUrl);
//   }
// }
