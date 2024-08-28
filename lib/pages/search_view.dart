import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/get_products_cubit.dart';
import 'package:store_app/cubit/get_products_state.dart';
import 'package:store_app/pages/product_description_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  void clearSearchHistory(){
    _searchController.clear();
    context.read<GetProductsCubit>().clearSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.isEmpty) {
                  context.read<GetProductsCubit>().clearSearchHistory(); 
                } else {
                  context.read<GetProductsCubit>().getProduct(myProduct: value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Search here',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<GetProductsCubit, ProductStates>(
              builder: (context, state) {
                if (state is NoProductState) {
                  return const Center(child: Text('No products available.'));
                } else if (state is ProductFailureState) {
                  return Center(child: Text(state.errMessage));
                } else if (state is ProductLoadedState) {
                  if (state.products.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  } else {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(state.products[index].image, width: 50, height: 50),
                          title: Text(state.products[index].title),
                          trailing: Text('\$${state.products[index].price}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDescriptionView(product: state.products[index]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

