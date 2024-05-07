import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// class deleteService {
//   Future<void> uploadPoster({
//     required String party,
//     required String language,
//     required String url,
//   }) async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? token = prefs.getString('token');
//     final String? userId = prefs.getString('userId');
//     print(token);

//     final headers = <String, String>{
//       'Content-Type': 'application/json',
//       // 'TOKEN': token ?? '',
//       'TOKEN':
//           "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho",
//       'app-user-id': "109053525479883029326",
//       "DEVICE_ID": "567",
//       "CLIENT_VERSION": "23",
//       "CLIENT_TYPE": "ANDROID",
//       "CLIENT_VERSION_CODE": "75"
//     };

//     final response = await http.post(
//       Uri.parse('https://backend.designboxconsuting.com/poster/post/v1/post/7976686c-05a4-4b88-ae84-d21ab5c'),
//       // body: jsonEncode(requestBody),
//       headers: headers,
//     );

//     if (response.statusCode == 200) {
//       // Successfully uploaded poster
//       print('Poster uploaded successfully');
//     } else {
//       // Failed to upload poster
//       print('Failed to upload poster. Status code: ${response.statusCode}');
//     }
//   }
// }
class DeleteService {
  Future<void> deletePoster(String postId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? userId = prefs.getString('userId');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'TOKEN':
          "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDkwNTM1MjU0Nzk4ODMwMjkzMjYiLCJpYXQiOjE3MTM5NzkwMzYsIlVTRVJfQ0xBSU0iOnsidXNlcklkIjoiMTA5MDUzNTI1NDc5ODgzMDI5MzI2In0sImV4cCI6MTc0NTUxNTAzNn0.vg58cFpffpaF87HzITNe_HVWu4aYK4VYwz9SQ3I7Aho",
      'app-user-id': "109053525479883029326",
      "DEVICE_ID": "567",
      "CLIENT_VERSION": "23",
      "CLIENT_TYPE": "ANDROID",
      "CLIENT_VERSION_CODE": "75"
    };

    final response = await http.delete(
      Uri.parse(
          'https://backend.designboxconsuting.com/poster/post/v1/post/$postId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // Successfully deleted poster
      print('Poster deleted successfully');
    } else {
      // Failed to delete poster
      print('Failed to delete poster. Status code: ${response.statusCode}');
    }
  }
}
