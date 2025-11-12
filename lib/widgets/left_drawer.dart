import 'package:flutter/material.dart';
// Import halaman-halaman yang akan dituju
import 'package:football_news/screens/news_entry_list.dart';
import 'package:football_news/screens/menu.dart';
import 'package:football_news/screens/newslist_form.dart'; // [cite: 86] TODO di tutorial, sekarang di-import

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Bagian Header Drawer
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // [cite: 115]
            ),
            child: Column(
              children: [
                Text(
                  'Football News', // [cite: 119]
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh berita sepak bola terkini di sini!", // [cite: 128]
                  // TODO Selesai: [cite: 129, 130]
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal, // "weight biasa"
                  ),
                ),
              ],
            ),
          ),
          // Bagian Routing
          ListTile(
            leading: const Icon(Icons.list), // Saya ganti ikonnya
            title: const Text('News List'),
            onTap: () {
              // Route to news list page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('News List'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}