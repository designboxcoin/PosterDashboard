// // import 'dart:convert';
// // import 'dart:io';

// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// // class PosterService {
// //   Future<void> uploadImage(String filePath) async {
// //     final url = Uri.parse(
// //         'http://backend.designboxconsuting.com/poster/files/v1/new?mediaType=IMAGE');
// //     final file = File(filePath);
// //     final bytes = await file.readAsBytes();
// //     final headers = <String, String>{
// //       'Content-Type': 'application/json',
// //       // 'TOKEN': token ?? '',
// //       'TOKEN':
// //           "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho",
// //       'app-user-id': "109053525479883029326",
// //       "DEVICE_ID": "567",
// //       "CLIENT_VERSION": "23",
// //       "CLIENT_TYPE": "ANDROID",
// //       "CLIENT_VERSION_CODE": "75"
// //     };

// //     final response = await http.post(
// //       url,
// //       headers: headers,
// //       body: jsonEncode({'file': base64Encode(bytes)}),
// //     );

// //     if (response.statusCode == 200) {
// //       print('Image uploaded successfully');
// //     } else {
// //       print('Failed to upload image. Status code: ${response.statusCode}');
// //     }
// //   }

// // // // Usage
// // // uploadImage('/path/to/your/image.jpg');

// //   Future<void> uploadPoster({
// //     required String party,
// //     required String language,
// //     required String url,
// //   }) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final String? token = prefs.getString('token');
// //     final String? userId = prefs.getString('userId');
// //     print(token);
// //     final Map<String, dynamic> requestBody = {
// //       "description": "hello",
// //       "party": party,
// //       "language": language,
// //       "mediaType": "IMAGE",
// //       "liveAt": 0,
// //       "url": url,
// //     };
// //     final headers = <String, String>{
// //       'Content-Type': 'application/json',
// //       // 'TOKEN': token ?? '',
// //       'TOKEN':
// //           "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho",
// //       'app-user-id': "109053525479883029326",
// //       "DEVICE_ID": "567",
// //       "CLIENT_VERSION": "23",
// //       "CLIENT_TYPE": "ANDROID",
// //       "CLIENT_VERSION_CODE": "75"
// //     };

// //     final response = await http.post(
// //       Uri.parse('https://backend.designboxconsuting.com/poster/post/v1/post'),
// //       body: jsonEncode(requestBody),
// //       headers: headers,
// //     );

// //     if (response.statusCode == 200) {
// //       // Successfully uploaded poster
// //       print('Poster uploaded successfully');
// //     } else {
// //       // Failed to upload poster
// //       print('Failed to upload poster. Status code: ${response.statusCode}');
// //     }
// //   }
// // }
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:http/http.dart' as http;

// class PosterService {
//   static const _baseUrl = 'https://backend.designboxconsuting.com/poster';
//   static const _uploadUrl = '$_baseUrl/files/v1/new?mediaType=IMAGE';
//   static const _postUrl = '$_baseUrl/post/v1/post';

//   static const _headers = <String, String>{
//     'Content-Type': 'application/json',
//     'app-user-id': "109053525479883029326",
//     'TOKEN':
//         'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho',
//     'DEVICE_ID': '567',
//     'CLIENT_VERSION': '23',
//     'CLIENT_TYPE': 'ANDROID',
//     'CLIENT_VERSION_CODE': '75',
//   };

//   // Future<String> uploadImage(Uint8List bytes) async {
//   //   final headers = <String, String>{
//   //     'Content-Type': 'multipart/form-data',
//   //     'app-user-id': "109053525479883029326",
//   //     'TOKEN':
//   //         'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho',
//   //     'DEVICE_ID': '567',
//   //     'CLIENT_VERSION': '23',
//   //     'CLIENT_TYPE': 'ANDROID',
//   //     'CLIENT_VERSION_CODE': '75',
//   //   };
//   //   final response = await http.post(
//   //     Uri.parse("https://backend.designboxconsuting.com/poster/files/v1/new"),
//   //     headers: headers,
//   //     body: bytes,
//   //   );

//   //   if (response.statusCode == 200) {
//   //     final jsonResponse = jsonDecode(response.body);
//   //     final imageUrl = jsonResponse
//   //         .toString(); // Verify the actual structure of the response
//   //     if (imageUrl != null) {
//   //       return imageUrl;
//   //     } else {
//   //       throw Exception('Failed to extract image URL from response');
//   //     }
//   //   } else {
//   //     throw Exception(
//   //         'Failed to upload image. Status code: ${response.statusCode}');
//   //   }
//   // }
//   Future<String> uploadImage(Uint8List bytes) async {
//     final headers = <String, String>{
//       'Content-Type': 'application/json',
//       // 'media-type': 'application/octet-stream',
//       'app-user-id': "109053525479883029326",
//       'TOKEN':
//           'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho',
//       'DEVICE_ID': '567',
//       'CLIENT_VERSION': '23',
//       'CLIENT_TYPE': 'ANDROID',
//       'CLIENT_VERSION_CODE': '75',
//     };

//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'https://backend.designboxconsuting.com/poster/files/v1/new?mediaType=IMAGE'),
//     );

//     // Add the image file as a part
//     request.files.add(
//       http.MultipartFile.fromBytes(
//         'file',
//         bytes,
//         filename: 'image.jpg',
//       ),
//     );

//     // Add headers
//     request.headers.addAll(headers);

//     // Send the request
//     final streamedResponse = await request.send();

//     // Check the response status code
//     if (streamedResponse.statusCode == 200) {
//       // Directly use the URL provided in the response
//       return streamedResponse.request!.url.toString();
//     } else {
//       throw Exception(
//           'Failed to upload image. Status code: ${streamedResponse.statusCode}');
//     }
//   }

//   Future<void> uploadPoster(
//       String party, String language, String imageUrl) async {
//     print(imageUrl);
//     final requestBody = {
//       'description': 'hello',
//       'party': party,
//       'language': language,
//       'mediaType': 'IMAGE',
//       'liveAt': 0,
//       'url': imageUrl,
//     };

//     final response = await http.post(
//       Uri.parse(_postUrl),
//       headers: _headers,
//       body: jsonEncode(requestBody),
//     );

//     if (response.statusCode == 200) {
//       // Successfully uploaded poster
//       print('Poster uploaded successfully');
//     } else {
//       throw Exception(
//           'Failed to upload poster. Status code: ${response.statusCode}');
//     }
//   }
// }

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PosterService {
  static const _baseUrl = 'https://backend.designboxconsuting.com/poster';
  static const _uploadUrl = '$_baseUrl/files/v1/new?mediaType=IMAGE';
  static const _postUrl = '$_baseUrl/post/v1/post';
  static const _fetchUrl = '$_baseUrl/post/v1/post';

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

  Future<List<String>> fetchStates() async {
    final response = await http.get(Uri.parse(
        'https://backend.designboxconsuting.com/poster/config/v1/config'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> states = jsonData['states'];
      return states.map((state) => state.toString()).toList();
    } else {
      throw Exception(
          'Failed to fetch states. Status code: ${response.statusCode}');
    }
  }

  Future<String> uploadImage(Uint8List bytes) async {
    final headers = await _getHeaders();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(_uploadUrl),
    );

    // Add the image file as a part
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: 'image.jpg',
      ),
    );

    // Add headers
    request.headers.addAll(headers);

    // Send the request
    final streamedResponse = await request.send();

    // Check the response status code
    if (streamedResponse.statusCode == 200) {
      // Read the response as a string
      final responseString = await streamedResponse.stream.bytesToString();

      // Directly use the URL provided in the response
      return responseString;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${streamedResponse.statusCode}');
    }
  }

  Future<Map<String, List<String>>> fetchPosters(
      String party, String language) async {
    final response = await http.get(
      Uri.parse('$_fetchUrl?party=$party&language=$language'),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> posts = jsonData['posts'];
      final List<String> posterUrls = posts
          .map((post) => post['url'].toString())
          .toList(); // Extract URLs of posters
      final List<String> postIds = posts
          .map((post) => post['postId'].toString())
          .toList(); // Extract IDs of posters
      return {'posterUrls': posterUrls, 'postIds': postIds};
    } else {
      throw Exception(
          'Failed to fetch posters. Status code: ${response.statusCode}');
    }
  }

  Future<void> deletePoster(String postId) async {
    final deleteUrl = '$_postUrl/$postId';
    final response = await http.delete(
      Uri.parse(deleteUrl),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      // Successfully deleted poster
      print('Poster deleted successfully');
    } else {
      throw Exception(
          'Failed to delete poster. Status code: ${response.statusCode}');
    }
  }

  Future<void> reorderPosters(List<String> postIds) async {
    final reorderUrl =
        'https://backend.designboxconsuting.com/poster/post/v1/post/order?postIds=${postIds.join('&postIds=')}';

    final response = await http.put(
      Uri.parse(reorderUrl),
      headers: await _getHeaders(),
    );

    if (response.statusCode == 200) {
      // Successfully reordered posters
      print('Posters reordered successfully');
    } else {
      throw Exception(
          'Failed to reorder posters. Status code: ${response.statusCode}');
    }
  }

  Future<void> uploadPoster(
      String party, String language, String imageUrl) async {
    final requestBody = {
      'description': 'hello',
      'party': party,
      'language': language,
      'mediaType': 'IMAGE',
      'liveAt': 0,
      'url': imageUrl,
    };

    final response = await http.post(
      Uri.parse(_postUrl),
      headers: await _getHeaders(),
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // Successfully uploaded poster
      print('Poster uploaded successfully');
    } else {
      throw Exception(
          'Failed to upload poster. Status code: ${response.statusCode}');
    }
  }
}
