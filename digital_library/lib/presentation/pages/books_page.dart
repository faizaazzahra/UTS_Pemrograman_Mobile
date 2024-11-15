import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class BooksPage extends StatefulWidget {
  final HomeController controller;

  BooksPage(this.controller);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final List<Map<String, String>> books = [
    {'title': 'Pemrograman Flutter', 'category': 'Teknologi', 'description': 'Panduan lengkap pemrograman Flutter.'},
    {'title': 'Sejarah Dunia', 'category': 'Sejarah', 'description': 'Mengupas sejarah dunia dari berbagai era.'},
    {'title': 'Fisika Dasar', 'category': 'Sains', 'description': 'Konsep dasar fisika untuk pemula.'},
    {'title': 'Psikologi Remaja', 'category': 'Psikologi', 'description': 'Pemahaman psikologi remaja modern.'},
    {'title': 'Kuliner Nusantara', 'category': 'Kuliner', 'description': 'Resep masakan khas Indonesia.'},
  ];

  final List<Map<String, String>> favoriteBooks = [];

  void addToFavorites(Map<String, String> book) {
    setState(() {
      if (!favoriteBooks.contains(book)) {
        favoriteBooks.add(book);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${book['title']} ditambahkan ke favorit!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${book['title']} sudah ada di favorit.')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Buku',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.book, color: Colors.blueAccent),
                      title: Text(book['title'] ?? 'Unknown Title'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kategori: ${book['category']}'),
                          Text(book['description'] ?? 'No description'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite, color: favoriteBooks.contains(book) ? Colors.red : Colors.grey),
                        onPressed: () => addToFavorites(book),
                      ),
                      onTap: () {
                        // Tambahkan navigasi ke detail buku jika diperlukan
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Klik pada ${book['title']}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 0, // Index ini disesuaikan dengan posisi tab 'Buku'
      controller: widget.controller,
    );
  }
}