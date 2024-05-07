// import 'package:dashboard/authentication.dart';
// import 'package:dashboard/login-viewmodel.dart';
// import 'package:dashboard/primarybutton.dart';
// import 'package:flutter/material.dart';

// import 'package:stacked/stacked.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   int count = 0;
//   final Authentication _authentication = Authentication();

//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return ViewModelBuilder<LoginViewModel>.reactive(
//         viewModelBuilder: () => LoginViewModel(),
//         builder: (context, model, child) => Scaffold(
//               backgroundColor: Colors.white,
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Spacer(),
//                     Text('Posters for BJP',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w800,
//                             fontSize: 32,
//                             fontFamily: 'Work-Sans',
//                             color: themeData.colorScheme.onBackground)),
//                     const SizedBox(height: 4),
//                     Text(
//                       'भाजपा के दैनिक पोस्टर फोटो और नाम के साथ',

//                       // 'एक क्लिक में पायें पोस्टर अपनी फोटो के साथ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'Mukta',
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87),
//                     ),
//                     GestureDetector(
//                         // onTap: () => setState(() {
//                         //       if (count < 10) {
//                         //         count++;
//                         //       } else {
//                         //         Navigator.push(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //               builder: (context) => TestLogin()),
//                         //         );
//                         //       }
//                         //       //TODO: test login settings here:
//                         //     }),
//                         child: Image.asset(
//                       "Asset/Images/Onboarding-Asset-01.jpeg",
//                       height: 244,
//                     )),
//                     const SizedBox(
//                       height: 32.0,
//                     ),
//                     const SizedBox(
//                       height: 44.0,
//                     ),
//                     PrimaryButton(
//                       // isLoading: model.isLoading,
//                       isEnabled: true,
//                       onTap: () async {
//                         // model.isLoading = true;
//                         await _authentication.signInWithGoogle(context);
//                         // model.isLoading = false;
//                       },
//                       height: 56,
//                       label: 'Register',
//                       iconPath: 'Asset/Icons/Google.svg',
//                       color: themeData.colorScheme.primary,
//                     ),
//                     const Spacer(),
//                     Text(
//                       'By signing up you agree to our\n“Terms of Service” and “Privacy Policy',
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                       height: 32.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//   }
// }

// import 'dart:convert';

// import 'package:dashboard/dashboardview.dart';
// import 'package:dashboard/primarybutton.dart';
// import 'package:dashboard/searchfeild.dart';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class TestLogin extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);

//     return Scaffold(
//       backgroundColor: themeData.colorScheme.background,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         alignment: Alignment.center,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Test user login',
//               style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                   fontFamily: 'Montserrat',
//                   color: themeData.colorScheme.onBackground),
//             ),
//             SizedBox(
//               height: 44,
//             ),
//             SearchField(
//                 controller: emailController,
//                 label: Text('email'),
//                 onChanged: (value) {},
//                 isLoading: false,
//                 isSearchField: false),
//             SizedBox(
//               height: 12,
//             ),
//             SearchField(
//                 controller: passwordController,
//                 label: Text('password'),
//                 onChanged: (value) {},
//                 isLoading: false,
//                 isSearchField: false),
//             SizedBox(
//               height: 44,
//             ),
//             PrimaryButton(
//               label: 'Log In',
//               height: 56,
//               isLoading: false, // You can use a ViewModel to manage this state
//               color: themeData.colorScheme.primary,
//               onTap: () async {
//                 var url = Uri.parse(''
//                     'https://backend.designboxconsuting.com/poster/user/v1/admin/login?username=${emailController.text.trim()}&password=${passwordController.text.trim()}');
//                 var response = await http.post(url);

//                 if (response.statusCode == 200) {
//                   Map<String, dynamic> jsonResponse =
//                       json.decode(response.body);
//                   String token = jsonResponse['message'];
//                   String userId = jsonResponse['data']['userId'];

//                   await TokenValidity(token, true);
//                   await saveUserId(userId);

//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => DashboardView()),
//                   );
//                 } else {
//                   // Login failed, handle the response
//                   print('Login failed: ${response.statusCode}');
//                 }
//               },
//               isEnabled: true,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> TokenValidity(String token, bool isValid) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//     await prefs.setBool('isTokenValid', isValid);
//   }

//   Future<void> saveUserId(String userId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userId', userId);
//     print("shared");
//     print(userId);
//   }
// }

import 'dart:convert';

import 'package:dashboard/dashboardview.dart';
import 'package:dashboard/primarybutton.dart';
import 'package:dashboard/searchfeild.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TestLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Test user login',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: themeData.colorScheme.onBackground),
            ),
            SizedBox(
              height: 44,
            ),
            SearchField(
                controller: emailController,
                label: Text('email'),
                onChanged: (value) {},
                isLoading: false,
                isSearchField: false),
            SizedBox(
              height: 12,
            ),
            SearchField(
                controller: passwordController,
                label: Text('password'),
                onChanged: (value) {},
                isLoading: false,
                isSearchField: false),
            SizedBox(
              height: 44,
            ),
            PrimaryButton(
              label: 'Log In',
              height: 56,
              isLoading: false, // You can use a ViewModel to manage this state
              color: themeData.colorScheme.primary,
              onTap: () async {
                var url = Uri.parse(
                    'https://backend.designboxconsuting.com/poster/user/v1/admin/login?username=${emailController.text.trim()}&password=${passwordController.text.trim()}');
                var response = await http.post(url);

                if (response.statusCode == 200) {
                  Map<String, dynamic> jsonResponse =
                      json.decode(response.body);
                  String token = jsonResponse['message'];
                  String userId = jsonResponse['data']['userId'];

                  await TokenValidity(token, true);
                  await saveUserId(userId);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DashboardView()),
                  );
                } else {
                  // Login failed, handle the response
                  print('Login failed: ${response.statusCode}');
                  print('Response body: ${response.body}');
                }
              },
              isEnabled: true,
            )
          ],
        ),
      ),
    );
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
}
