import 'package:flutter/material.dart';
// Import untuk halaman-halaman navigasi
import 'package:football_news/screens/news_entry_list.dart';
import 'package:football_news/screens/newslist_form.dart';
import 'package:football_news/screens/login.dart';

// Import untuk package autentikasi
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil request dari Provider untuk logout
    final request = context.watch<CookieRequest>();

    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Jadikan onTap async untuk await logout
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Logika navigasi berdasarkan nama item
          if (item.name == "Add News") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewsFormPage()));
          } else if (item.name == "See Football News") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewsEntryListPage()));
          } 
          // Logika untuk Logout
          else if (item.name == "Logout") {
            // ! PENTING: Ganti URL ini sesuai kebutuhanmu
            // "http://localhost:8000/auth/logout/" (jika pakai Chrome)
            // "http://10.0.2.2:8000/auth/logout/" (jika pakai Emulator Android)
            final response = await request.logout(
                "http://localhost:8000/auth/logout/");
            
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message See you again, $uname."),
                ));
                // Kembali ke Halaman Login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}