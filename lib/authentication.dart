import 'dart:convert';

import 'package:dashboard/dashboardview.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final idToken = googleSignInAuthentication.idToken;

      print('ID Token: $idToken');

      // Call the login endpoint with the token
      final loginSuccess = await loginUserWithGoogle(idToken!);

      if (loginSuccess) {
        // Save user ID and navigate to homepage
        final prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('userId');
        await saveAuthentication(true);
        if (userId != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DashboardView()));
        } else {
          // Handle missing user ID
          print('User ID is missing');
        }
      } else {
        // Handle login failure
      }
    }
  }

  Future<void> saveAuthentication(bool isAuthenticated) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }

  // Future<bool> isUserLoggedIn() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userId = prefs.getString('userId');
  //   return userId != null;
  // }
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthenticated') ?? false;
  }

  Future<bool> loginUserWithGoogle(String idToken) async {
    final url = Uri.parse(
        'https://backend.designboxconsuting.com/poster/user/v1/user/login?token=$idToken');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(response.body);
        final token = responseData['message'];
        final userId = responseData['data']['userId'];
        await saveUserId(userId); // Extract the token from the response
        await saveToken(token);

        await saveUserData(responseData['data']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    print("shared");
    print(token);
  }

  Future<void> TokenValidity(String token, bool isValid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setBool('isTokenValid', isValid);
  }

  Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
    print("shared");
    print(userId);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(userData));
  }
}
