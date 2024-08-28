import 'package:flutter/material.dart';
import 'package:store_app/pages/check_out_view.dart';
import 'package:store_app/pages/product_description_view.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  CartViewState createState() => CartViewState();
}

class CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(cartItems[index].image,
                        width: 50, height: 50),
                    title: Text(cartItems[index].title),
                    subtitle: Text(r'$' '${cartItems[index].price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          cartItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckoutView(cartItems: cartItems),
                        ),
                      );
                    },
                    text: 'Total',
                    )),
          ],
        ),
      ),
    );
  }
}
