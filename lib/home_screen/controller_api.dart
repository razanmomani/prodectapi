import 'dart:convert';
import 'package:api/home_screen/model_api.dart';
import 'package:api/utils/helper/general_status.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerApi extends GetxController{
  List<MyData> data = [];
  var statusModel = GeneralStatusModel().obs;

  Future<MyData> fetchData() async {
    statusModel.value.updateStatus(GeneralStatus.waiting);
    var url = Uri.parse('https://reqres.in/api/users?page=2');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      statusModel.value.updateStatus(GeneralStatus.success);
      return MyData.fromMap(json.decode(response.body));
    } else {
      statusModel.value.updateStatus(GeneralStatus.erorr);
      throw Exception('Failed to load data');
    }
  }
  bool get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;
  bool get isSuccess => statusModel.value.status.value == GeneralStatus.success;
  bool get isError => statusModel.value.status.value == GeneralStatus.erorr;
}




