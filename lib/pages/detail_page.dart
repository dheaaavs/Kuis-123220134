import 'package:flutter/material.dart';
import '../model/phone_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    final phoneModel = phones[widget.index];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Produk",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[300], // Placeholder jika gambar gagal dimuat
              child: Image.network(
                phoneModel.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Konten Detail Produk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Produk dan Harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          phoneModel.model,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "\$${phoneModel.price[0]}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Brand
                  Text(
                    "Brand ${phoneModel.brand}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Detail Produk
                  Text(
                    "Memori: ${phoneModel.memory}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Processor: ${phoneModel.processor}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  //baterai
                  Text(
                    "Baterai: ${phoneModel.batteryCapacity}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  // Warna
                  Text(
                    "Warna: ${phoneModel.colors.join(', ')}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  // Ukuran
                  Text(
                    "Ukuran: ${phoneModel.size.join(', ')}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),

                  //Storage
                  Row(
                    children: [
                      Icon(Icons.storage, color: Colors.teal),
                      SizedBox(width: 8),
                      Text("Storage:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Wrap(
                    spacing: 8, //horizontal
                    runSpacing: 8, //vertikal
                    children: phones[widget.index].storage.map((storage) {  //penyimpanan
                      return ElevatedButton(
                          onPressed: (){
                          },
                          child: Text(storage.toString(), style: TextStyle(fontSize: 14)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade300,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  //Go To Website
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                          await launchUrl(Uri.parse(phones[widget.index].websiteUrl));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Go To Website",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
