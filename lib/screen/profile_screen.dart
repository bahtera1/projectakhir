import 'package:flutter/material.dart';
import 'package:projectakhir/screen/login_page.dart'; // Sesuaikan dengan path yang benar jika diperlukan

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/profile_image.png'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email Pengguna',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi yang sesuai untuk tombol ini
              },
              child: Text('Edit Profil'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
