import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

// ignore: must_be_immutable
class ProductDescription extends StatelessWidget {
  ProductDescription({super.key, required this.product});
  
  ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  '${product.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${product.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                children: [
                  Icon(Icons.star, color: Colors.amber,),
                  Text(
                    '${product.rating.rate}',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              r'$' '${product.price}',
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: Text(
                '${product.discription}',
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
  }
}