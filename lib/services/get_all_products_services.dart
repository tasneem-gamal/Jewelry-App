
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsServices {
  Future<List<ProductModel>> getAllProducts({String myProduct = ''}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/jewelery');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductModel product = ProductModel.fromJson(data[i]);
      if (product.title.toLowerCase().contains(myProduct.toLowerCase())) {
        productsList.add(product);
      }
    }
    return productsList;
  }
}
