import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image
  }) async{
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products', 
      body: {
      'title':title,
      'price': price,
      'description': desc,
      'image': image
    }
    );
    return ProductModel.fromJson(data);
  }
}