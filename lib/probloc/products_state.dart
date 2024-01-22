part of 'products_bloc.dart';

 class ProductsState {
    List<Products>?plist=[];

   ProductsState({required this.plist});
}

class ProductsInitial extends ProductsState {
  ProductsInitial({required super.plist});

}
