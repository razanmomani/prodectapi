import 'dart:convert';
import 'package:api/prodect/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProdectController extends GetxController {
  var products = <ProdectModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
  void getProducts() async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
      // print(response.body);
      // print(response.statusCode);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        List<dynamic> result = json.decode(response.body);
        products.assignAll(result.map((json) => ProdectModel.fromMap(json)));
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
