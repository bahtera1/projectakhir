// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:projectakhir/screen/home_page.dart';
// import 'dart:convert';
// import 'package:projectakhir/screen/login_page.dart';

// class AuthController {
//   Future<void> login(
//       BuildContext context, String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse(
//             'http://127.0.0.1:8000/login'), // Use 'http://10.0.2.2:8000' for Android emulator
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({'email': email, 'password': password}),
//       );

//       print('Login Response: ${response.statusCode} - ${response.body}');

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         final String token = responseData['token'];

//         // Save token (you can use SharedPreferences or any local storage)
//         // SharedPreferences prefs = await SharedPreferences.getInstance();
//         // await prefs.setString('token', token);

//         // Navigate to the next page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       } else {
//         // Show error message
//         _showErrorDialog(context, 'Login Failed', 'Invalid email or password.');
//       }
//     } catch (e) {
//       print('Login Error: $e');
//       _showErrorDialog(
//           context, 'Login Error', 'An error occurred while logging in.');
//     }
//   }

//   Future<void> register(
//     BuildContext context, {
//     required String name,
//     required String email,
//     required String password,
//     required String phone,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse(
//             'http://127.0.0.1:8000/login'), // Use 'http://10.0.2.2:8000' for Android emulator
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'name': name,
//           'email': email,
//           'password': password,
//           'password_confirmation': password, // Add password confirmation
//           'phone': phone,
//         }),
//       );

//       print('Register Response: ${response.statusCode} - ${response.body}');

//       if (response.statusCode == 201) {
//         // Check for status code 201
//         // Registration successful
//         await _showSuccessDialog(context);
//       } else {
//         // Show error message
//         _showErrorDialog(
//             context, 'Registration Failed', 'Failed to register user.');
//       }
//     } catch (e) {
//       print('Registration Error: $e');
//       _showErrorDialog(context, 'Registration Error',
//           'An error occurred while registering.');
//     }
//   }

//   Future<void> _showSuccessDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Registration Successful'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text('Your registration was successful.'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 Navigator.pushReplacement(
//                   // Navigate to login page
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginPage(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
