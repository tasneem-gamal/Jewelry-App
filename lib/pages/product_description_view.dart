import 'package:flutter/material.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'package:store_app/widgets/product_description.dart';

// ignore: must_be_immutable
class ProductDescriptionView extends StatelessWidget {
  ProductDescriptionView({super.key, required this.product});

  static String id = 'ProductDescriptionView';
  ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductDescription(product: product),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
          function: (){
            addToCart(product);  
            showSnackBar(context, 'Add to cart successfully');
          }, 
          text: 'Add to cart', 
        ),
      ),
    );
  }
}
  List<ProductModel> cartItems = [];
  void addToCart(ProductModel product) {
    cartItems.add(product);
    print('Product added to cart: ${product.title}');
  }
