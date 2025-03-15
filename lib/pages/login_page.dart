import 'package:flutter/material.dart';
import 'package:kuis_f_ril/pages/list_product.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isError = false;
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Selamat datang kembali di ThriftStar!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 24),

            // Username Field
            TextField(
              controller: _username,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 12),

            // Password Field
            TextField(
              controller: _password,
              obscureText: isObsecure,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  icon: Icon(isObsecure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String msg = "";
                  if (_username.text == "134" && _password.text == "134") {
                    msg = "Login berhasil";
                    setState(() {
                      isError = false;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ListProduct(username: _username.text),
                      ),
                    );
                  } else {
                    msg = "Username/password salah";
                    setState(() {
                      isError = true;
                    });
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
