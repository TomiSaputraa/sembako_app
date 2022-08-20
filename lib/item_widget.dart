import 'package:flutter/material.dart';
import 'package:toko_sembako/data.dart';
import 'package:toko_sembako/product_detail.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return ProductDetail(
              product: product,
            );
          }),
        );
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.green,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.image,
              child: SizedBox(
                width: 150,
                child: Image.asset(product.image),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Rp " + product.price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              product.quantity,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Divider(
              height: 2,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 20,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Beli",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text("0"),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 18,
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
