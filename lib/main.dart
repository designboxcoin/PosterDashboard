import 'package:dashboard/dashboardview.dart';
import 'package:dashboard/loginview.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Add this line to initialize the GoogleSignIn plugin
  // GoogleSignIn googleSignIn = GoogleSignIn();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poster for BJP Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the LoginPage as the initial route
      initialRoute: '/login',
      routes: {
        // Define the routes
        '/login': (context) => TestLogin(),
        // '/dashboard': (context) => const DashboardView(),
        '/upload': (context) => DashboardView(),
        '/Upload': (context) =>
            DashboardView(), // Define the route for '/Upload'
      },
    );
  }
}
