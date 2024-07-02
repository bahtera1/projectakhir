import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectakhir/screen/home_page.dart';
import 'package:projectakhir/screen/register_page.dart';
import 'package:projectakhir/screen/userprovider.dart';
import 'package:provider/provider.dart';

import '../data/service/auth.service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final responseData = await apiservice.login(
          _emailController.text,
          _passwordController.text,
        );

        setState(() {
          _isLoading = false;
        });

        // Handle login success
        final token = responseData!['token'];
        final username = responseData['name'];

        // Update UserProvider dengan username
        Provider.of<UserProvider>(context, listen: false).setUsername(username);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        // Handle login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login gagal: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Please login to continue',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                _isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 2 * 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _login,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                SizedBox(),
                Text.rich(
                  TextSpan(
                    text: "Belum Punya Akun? ",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrasiScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 3, 3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// loginscreen.dart 

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:projectakhir/presentation/controller/auth_controller.dart';
// import 'package:projectakhir/screen/register_page.dart';
// import 'package:projectakhir/screen/home_page.dart'; // Make sure HomePage is imported

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final AuthController _authController = AuthController();
//   bool _isPasswordVisible = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             colors: [
//               Colors.lightBlue,
//               Colors.lightBlue,
//               Colors.blue,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: ListView(
//             children: [
//               SizedBox(height: size.height * 0.03),
//               Text(
//                 "LostNFound",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 37,
//                   color: const Color.fromARGB(255, 245, 245, 245),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Text(
//                 "Welcome back you've\nbeen missed!",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(
//                   fontSize: 27,
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                   height: 1.2,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.04),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                   vertical: 10,
//                 ),
//                 child: TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: "Enter username",
//                     hintStyle: GoogleFonts.poppins(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                   vertical: 10,
//                 ),
//                 child: TextField(
//                   controller: _passwordController,
//                   obscureText: !_isPasswordVisible,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 22,
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     hintText: "Password",
//                     hintStyle: GoogleFonts.poppins(
//                       color: Colors.black45,
//                       fontSize: 19,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.black26,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               SizedBox(height: size.height * 0.04),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         _authController.login(
//                           context,
//                           _emailController.text.trim(),
//                           _passwordController.text.trim(),
//                         );
//                       },
//                       child: Container(
//                         width: size.width,
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurple,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Sign In",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               fontSize: 22,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.06),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 2,
//                           width: size.width * 0.2,
//                           color: Colors.black12,
//                         ),
//                         Text(
//                           "  Or continue with   ",
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.bold,
//                             color: const Color.fromARGB(255, 0, 0, 0),
//                             fontSize: 16,
//                           ),
//                         ),
//                         Container(
//                           height: 2,
//                           width: size.width * 0.2,
//                           color: Colors.black12,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.06),
//                     // Uncomment and add the correct asset paths if you have social icons
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     socialIcon("images/google.png"),
//                     //     socialIcon("images/apple.png"),
//                     //     socialIcon("images/facebook.png"),
//                     //   ],
//                     // ),
//                     SizedBox(height: size.height * 0.07),
//                     Text.rich(
//                       TextSpan(
//                         text: "Belum Punya Akun? ",
//                         style: GoogleFonts.poppins(
//                           color: const Color.fromARGB(255, 0, 0, 0),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => RegisterPage(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
