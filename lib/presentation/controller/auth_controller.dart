import 'package:flutter/material.dart';
import 'package:projectakhir/data/service/auth.service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      final response = await _authService.login(email, password);
      // Handle successful login, e.g., store token, navigate to home page, etc.
      print('Login success: $response');
      // Example: Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle error, e.g., show error message
      print('Login error: $e');
      // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  Future<void> register(
    BuildContext context, {
    required String name,
    required String email,
    required String password,
    required String phone, // Ganti phoneNumber menjadi phone
  }) async {
    try {
      final response = await _authService.register(
        name: name,
        email: email,
        password: password,
        phone: phone, // Ganti parameter yang dipassing ke authService
      );
      // Handle successful registration, e.g., show success message, navigate to login page, etc.
      print('Registration success: $response');
      // Example: Navigator.pop(context);
    } catch (e) {
      // Handle error, e.g., show error message
      print('Registration error: $e');
      // Example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
    }
  }
}
