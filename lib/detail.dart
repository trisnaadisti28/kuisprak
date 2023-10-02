import 'package:flutter/material.dart';
import 'package:kuisdisti/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatelessWidget {
  final Diseases penyakit;
  const Page2({Key? key, required this.penyakit}) : super(key: key);

  SnackBar? get snackbar => null;

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Berhasil menambahkan ke favorite'),
      action: SnackBarAction(
        label: 'Buka Favorite',
        onPressed: () {
          // Tambahkan aksi yang sesuai saat tombol aksi ditekan.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar!);
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    }
    await launch(_url.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(penyakit.name),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              _showSnackbar(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: PageView.builder(
                itemCount: penyakit.imgUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(penyakit.imgUrls);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Diseases Name: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                  child: Text(
                    penyakit.name,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      "Plant Name: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                    penyakit.plantName,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                  child: Text(
                    "Ciri - ciri: ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                    penyakit.nutshell[0],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                  child: Text(
                    "Diseases ID: ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                    penyakit.id,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      "Symptom: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                  child: Text(
                    penyakit.symptom,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchUrl(penyakit.imgUrls);
                  },
                  child: Text('URL Link'),
                ),
                SizedBox(width: 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
