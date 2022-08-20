import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toko_sembako/data.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1;
  void addCount() {
    count = count + 1;
    setState(() {});
  }

  void removeCount() {
    if (count != 0) {
      count = count - 1;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Detail",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.product.name,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: Hero(
              tag: widget.product.image,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Rp ${widget.product.price}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "/ ${widget.product.quantity}",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                widget.product.description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.bottomCenter,
            color: Colors.grey,
            child: Center(
              child: Row(
                children: [
                  IconButton(
                    onPressed: removeCount,
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: addCount,
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 190,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: Colors.green),
                      child: Center(
                        child: Text(
                          "Pesan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
