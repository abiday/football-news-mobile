import 'package:flutter/material.dart';
// TODO Selesai: Impor drawer [cite: 159]
import 'package:football_news/widgets/left_drawer.dart'; 

// Ini adalah StatefulWidget.
// Pikirkan ini seperti class Java yang bisa berubah-ubah datanya (punya "state").
// NewsFormPage adalah "blueprint"-nya.
// _NewsFormPageState adalah "objek" yang memegang data (state).
class NewsFormPage extends StatefulWidget {
    const NewsFormPage({super.key});

    @override
    State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  // GlobalKey ini seperti "pegangan" untuk Form kita,
  // dipakai untuk validasi dan reset form [cite: 190]
  final _formKey = GlobalKey<FormState>(); // [cite: 191]

  // Variabel untuk menyimpan data dari form
  String _title = ""; // [cite: 199]
  String _content = ""; // [cite: 200]
  String _category = "update"; // default value [cite: 201]
  String _thumbnail = ""; // [cite: 202]
  bool _isFeatured = false; // default value [cite: 203]
  final List<String> _categories = [ // [cite: 204]
    'transfer',
    'update',
    'exclusive',
    'match',
    'rumor',
    'analysis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add News Form', // [cite: 176]
            ),
          ),
          backgroundColor: Colors.indigo, // [cite: 179]
          foregroundColor: Colors.white, // [cite: 180]
        ),
        // TODO Selesai: Tambahkan drawer [cite: 182]
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey, // [cite: 193]
          child: SingleChildScrollView( // Membuat halaman bisa di-scroll [cite: 184]
            child: Column( // Menyusun field form secara vertikal
              crossAxisAlignment: CrossAxisAlignment.start, // [cite: 221]
              children: [
                // === Field Judul Berita ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul Berita", // [cite: 227]
                      labelText: "Judul Berita", // [cite: 228]
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // onChanged: dipanggil setiap ada ketikan, langsung update state
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // validator: dipanggil saat _formKey.currentState!.validate()
                    validator: (String? value) { // [cite: 240]
                      if (value == null || value.isEmpty) {
                        return "Judul tidak boleh kosong!"; // [cite: 242]
                      }
                      return null;
                    },
                  ),
                ),
                // === Field Isi Berita ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5, // [cite: 259]
                    decoration: InputDecoration(
                      hintText: "Isi Berita", // [cite: 261]
                      labelText: "Isi Berita", // [cite: 262]
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _content = value!; // [cite: 269]
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Isi berita tidak boleh kosong!"; // [cite: 274]
                      }
                      return null;
                    },
                  ),
                ),
                // === Field Kategori (Dropdown) ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Kategori", // [cite: 284]
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category, // [cite: 289]
                    items: _categories // [cite: 290]
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              // Membuat huruf pertama jadi kapital
                              child: Text(cat[0].toUpperCase() + cat.substring(1)), // [cite: 294]
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!; // [cite: 299]
                      });
                    },
                  ),
                ),
                // === Field URL Thumbnail ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "URL Thumbnail (opsional)", // [cite: 309]
                      labelText: "URL Thumbnail", // [cite: 310]
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value!; // [cite: 317]
                      });
                    },
                    // Tidak ada validator, karena opsional
                  ),
                ),
                // === Field Unggulan (Switch) ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile( // [cite: 325]
                    title: const Text("Tandai sebagai Berita Unggulan"), // [cite: 326]
                    value: _isFeatured, // [cite: 327]
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value; // [cite: 330]
                      });
                    },
                  ),
                ),
                // === Tombol Simpan ===
                Align(
                  alignment: Alignment.bottomCenter, // [cite: 340]
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo), // [cite: 347]
                      ),
                      onPressed: () {
                        // Cek validasi form
                        if (_formKey.currentState!.validate()) { // [cite: 389]
                          // Tampilkan dialog jika valid
                          showDialog( // [cite: 390]
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Judul dialog dari tutorial "Memunculkan Data" [cite: 394]
                                title: const Text('Produk berhasil tersimpan'),
                                // Menampilkan semua data yang di-input [cite: 395-408]
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Judul: $_title'), // [cite: 400]
                                      Text('Isi: $_content'), // [cite: 401]
                                      Text('Kategori: $_category'), // [cite: 402]
                                      Text('Thumbnail: $_thumbnail'), // [cite: 403]
                                      Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'), // [cite: 404]
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'), // [cite: 411]
                                    onPressed: () {
                                      Navigator.pop(context); // Tutup dialog
                                      _formKey.currentState!.reset(); // Reset form [cite: 414]
                                      // Opsional: reset state variabel manual jika perlu
                                      setState(() {
                                        _title = "";
                                        _content = "";
                                        _category = "update";
                                        _thumbnail = "";
                                        _isFeatured = false;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Simpan", // [cite: 375]
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}