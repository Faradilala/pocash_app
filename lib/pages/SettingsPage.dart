import 'package:pocash_app/helper/dbHelper.dart';
import 'package:pocash_app/other/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pocash_app/providers/user_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  final DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    // Access the UserProvider to get user data
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        backgroundColor: Colors.brown,
        leading: 
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Ubah Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "user@mail.com",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(
              height: 20,
            ),
            TextField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password Saat Ini",
                labelStyle: TextStyle(color: Colors.brown),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown)),
              ),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password Baru",
                labelStyle: TextStyle(color: Colors.brown),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _changePassword(user!);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)))),
              child: const Text("Simpan Password Baru"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembal
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown.shade800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)))),
                child: const Text("<< Kembali")
                ),
                SizedBox(height: 20.0),
                Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/aku.jpeg'), // Gantilah dengan path gambar Anda
                  radius: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // create bold heading style
                      const Text(
                        "About this App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Text("Aplikasi ini dibuat oleh: "),
                      Text("Nama : Faradila Wahyu Wijayanti"),
                      Text("Nim : 2141764158"),
                      Text("Tanggal : 26 September 2023"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _changePassword(User user) {
    String currentPasswordInput = currentPasswordController.text;
    String newPasswordInput = newPasswordController.text;

    if (currentPasswordInput == user.password) {
      // Password saat ini benar, simpan password baru
      dbHelper.changePassword(user.email!, newPasswordInput);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password berhasil diubah."),
      ));
    } else {
      // Password saat ini salah
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password saat ini salah. Ubah password gagal."),
      ));
    }
  }
}
