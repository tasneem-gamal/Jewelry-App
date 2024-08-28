import 'package:store_app/models/product_model.dart';

class ProductStates{}
class NoProductState extends ProductStates{}
class ProductLoadedState extends ProductStates {
  final List<ProductModel> products;

  ProductLoadedState({required this.products});
}
class ProductFailureState extends ProductStates{
  final String errMessage;

  ProductFailureState(this.errMessage);
}