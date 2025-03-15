import 'package:flutter/material.dart';
import 'package:kuis_f_ril/pages/detail_page.dart';
import 'package:kuis_f_ril/pages/login_page.dart'; // Import halaman login
import '../model/phone_data.dart';

class ListProduct extends StatefulWidget {
  final String username;
  const ListProduct({super.key, required this.username});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<bool> cart = List.generate(phones.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Daftar Produk",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman login dan mengganti halaman saat logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat datang, ${widget.username}!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => _phoneStore(context, index),
                itemCount: phones.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneStore(BuildContext context, int index) {
    final phoneModel = phones[index];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(index: index)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  phoneModel.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneModel.model,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${phoneModel.brand}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "\$${phoneModel.price[0]}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    cart[index] = !cart[index];
                  });
                },
                icon: Icon(
                  cart[index] ? Icons.shopping_cart : Icons.add_shopping_cart_outlined,
                  color: cart[index] ? Colors.orange : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
