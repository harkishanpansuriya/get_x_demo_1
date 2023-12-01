import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  void validateEmail(String value) {
    email.value = value;
    isEmailValid.value = ((value.isEmpty) ? null : GetUtils.isEmail(value))!;
  }

  void validatePassword(String value) {
    password.value = value;
    isPasswordValid.value = (value.isEmpty ? null : value.length >= 6)!;
  }
}
