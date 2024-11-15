import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class FavoritePage extends StatelessWidget {
  final HomeController controller;

  FavoritePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Buku Favorit',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Jumlah buku favorit, dapat disesuaikan
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.bookmark, color: Colors.redAccent),
                    title: Text('Buku Favorit ${index + 1}'),
                    subtitle: Text('Deskripsi singkat Buku Favorit ${index + 1}'),
                    onTap: () {
                      // Tambahkan navigasi ke detail buku favorit jika diperlukan
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Klik pada Buku Favorit ${index + 1}')),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 1, // Index ini disesuaikan dengan posisi tab 'Favorit'
      controller: controller,
    );
  }
}