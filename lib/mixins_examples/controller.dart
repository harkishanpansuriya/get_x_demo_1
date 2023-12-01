import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      change([], status: RxStatus.loading()); // Show loading indicator
      var response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var users = data['data'] as List<dynamic>;
        change(users, status: RxStatus.success()); // Update with data
      }
    } catch (error) {
      change(null,
          status: RxStatus.error('An error occurred')); // Show error message
    }
  }
}
