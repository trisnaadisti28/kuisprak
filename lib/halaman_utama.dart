import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'detail.dart';
import 'disease_data.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<bool> isLiked = List.generate(listDisease.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Diseases'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 0.8,
          ),
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases penyakit = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(penyakit: penyakit),
                  ),
                );
              },
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            penyakit.imgUrls,
                            fit: BoxFit
                                .cover, // Ini yang akan mengatur gambar agar rapi dalam kotak
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              penyakit.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2, // Jumlah maksimum baris yang diizinkan
                              minFontSize: 12.0, // Ukuran font minimum
                              maxFontSize: 16.0, // Ukuran font maksimum
                              overflow: TextOverflow.ellipsis, // Teks yang terlalu panjang akan dipotong dan ditampilkan "ellipsis"
                            ),
                            IconButton(
                              icon: Icon(
                                isLiked[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked[index] ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  isLiked[index] = !isLiked[index];
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
