import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toko_sembako/data.dart';
import 'package:toko_sembako/item_widget.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Sembako',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final data = Product("Bayam", '2000', 'lika', 'assets/img1.png',
      'Secara umu sayuran dan buah itu sehat');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          "Toko Buah & Sayur",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 19),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.5,
          ),
          itemBuilder: (context, index) {
            return ItemWidget(
              product: allData[index],
            );
          },
          itemCount: allData.length,
        ),
      ),
    );
  }
}
