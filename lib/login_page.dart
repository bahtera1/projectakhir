import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectakhir/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.lightBlue,
              Colors.lightBlue,
              Colors.blue,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                "LostNFound ",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: const Color.fromARGB(255, 245, 245, 245),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Welcome back you've\nbeen missed!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 27,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  height: 1.2,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 22,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter username",
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.black45,
                      fontSize: 19,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 22,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.black45,
                      fontSize: 19,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black26,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 2,
                          width: size.width * 0.2,
                          color: Colors.black12,
                        ),
                        Text(
                          "  Or continue with   ",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: size.width * 0.2,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // socialIcon("images/google.png"),
                        // socialIcon("images/apple.png"),
                        // socialIcon("images/facebook.png"),
                      ],
                    ),
                    SizedBox(height: size.height * 0.07),
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
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
