import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/get_products_state.dart';
import 'package:store_app/services/get_all_products_services.dart';

class GetProductsCubit extends Cubit<ProductStates> {
  GetProductsCubit() : super(NoProductState());

  Future<void> getProduct({String myProduct = ''}) async {
    if (myProduct.isEmpty) {
      emit(NoProductState());
      return;
    }

    try {
      final products = await GetAllProductsServices().getAllProducts(myProduct: myProduct);
      if (products.isEmpty) {
        emit(ProductFailureState('No products found'));
      } else {
        emit(ProductLoadedState(products: products));
      }
    } catch (e) {
      emit(ProductFailureState(e.toString()));
    }

    
  }
  void clearSearchHistory(){
      emit(NoProductState());
    }
}
