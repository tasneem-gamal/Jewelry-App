import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';

class CheckoutView extends StatelessWidget {
  final List<ProductModel> cartItems;

  const CheckoutView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalAmount = cartItems.fold(0, (sum, item) => sum + item.price);
    int deliveryFee = 70;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '\$${totalAmount + deliveryFee}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product total:',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '\$$totalAmount',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delivery Fee:',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '\$$deliveryFee',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
                function: (){}, 
                text: 'Checkout', 
              ),
      ),
    );
  }
}
