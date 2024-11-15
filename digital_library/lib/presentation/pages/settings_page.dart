import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class SettingsPage extends StatelessWidget {
  final HomeController controller;

  SettingsPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengaturan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.palette, color: Colors.blueAccent),
              title: const Text('Ganti Tema'),
              subtitle: const Text('Ubah tema aplikasi antara terang atau gelap'),
              onTap: () {
                // Tambahkan logika untuk mengubah tema aplikasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fitur Ganti Tema belum tersedia')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.language, color: Colors.green),
              title: const Text('Ganti Bahasa'),
              subtitle: const Text('Pilih bahasa aplikasi'),
              onTap: () {
                // Tambahkan logika untuk mengubah bahasa aplikasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fitur Ganti Bahasa belum tersedia')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.info, color: Colors.orange),
              title: const Text('Tentang Aplikasi'),
              subtitle: const Text('Informasi mengenai aplikasi e-library ini'),
              onTap: () {
                // Tambahkan navigasi atau dialog tentang aplikasi
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Tentang E-Library'),
                      content: const Text(
                        'E-Library adalah aplikasi perpustakaan digital yang memungkinkan pengguna '
                        'untuk mengakses koleksi buku secara online.',
                      ),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      selectedIndex: 2, // Index untuk tab 'Pengaturan'
      controller: controller,
    );
  }
}