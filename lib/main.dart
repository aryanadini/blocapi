import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbloc/probloc/products_bloc.dart';

import 'myapi/Products.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductsBloc>(create: (BuildContext context) =>
        ProductsBloc()..add(Fetch())
      ,)
    ],
    child: MyApp(),
  ),);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        body: BlocBuilder<ProductsBloc,ProductsState>(
          builder: (context,state){
            return state.plist!.length==0?Text("nodate"):ListView.builder(
                itemCount: state.plist!.length, itemBuilder:
                (BuildContext context, int index) {
                  Products p=state.plist![index];
                  return ListTile(
                    title: Text("${p.title}"),
                    subtitle: Text("${p.price}"),
                  );
            },
                );
          }
        ),
      ),
    );
  }
}

