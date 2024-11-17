import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsUI());
}

class SettingsUI extends StatelessWidget {
  const SettingsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan label DEBUG
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "About",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/IMG_1941.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              buildTextField("Nama Lengkap", "Khairu Reza Al Haris"),
              buildTextField("NIM", "21120122140167"),
              buildTextField("Jurusan", "Teknik Komputer"),
              buildTextField("Asal", "Batang, Indonesia"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Deskripsi Aplikasi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Aplikasi ini merupakan sebuah aplikasi yang berisikan beragam cocktail dimana dilengkapi dengan resep dan cara pembuatannya. "
                "Tersedia berbagai jenis cocktail seperti margarita, gin, mojito, dan lainnya."
                "Terdapat pula berbagai opsi mengenai resep yang digunakan.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: isi,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
