import 'dart:convert';

import 'package:productbloc/myapi/Myproducts.dart';
import 'package:productbloc/myapi/Products.dart';
import 'package:http/http.dart' as http;
class ApiService{
 Future< List<Products>?>fetchdata()async{
    var webdata=await http.get(Uri.parse("https://dummyjson.com/products"));
    var webdata_in_JSOnformat=jsonDecode(webdata.body);
    var FirstLevelData=Myproducts.fromJson(webdata_in_JSOnformat);
    var list=FirstLevelData.products;
    return list;

    
  }
}