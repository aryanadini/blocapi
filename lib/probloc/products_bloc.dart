import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productbloc/probloc/ApiService.dart';

import '../myapi/Products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial(plist: [])) {
    ApiService apiService=ApiService();
    on<Fetch>((event, emit) async{

    var list=await apiService.fetchdata();
    emit(ProductsState(plist:list));
    });
  }
}
