import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isFormValid = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  void validateForm() {
    bool isEmailValid = _isEmailValid(email.value);
    bool isPasswordValid = _isPasswordValid(password.value);
    isFormValid.value = isEmailValid && isPasswordValid;
  }

  bool _isEmailValid(String email) {
    // Simple email validation using regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    // Password length validation
    return password.length >= 6;
  }

  void submitForm() {
    if (isFormValid.value) {
      Get.snackbar('Success', 'Form submitted');
    } else {
      Get.snackbar('Error', 'Invalid input. Check email and password.');
    }
  }
}

class FormValidationEmailPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation & Submission')),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            _authController.email.value = value;
            _authController.validateForm();
          },
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          onChanged: (value) {
            _authController.password.value = value;
            _authController.validateForm();
          },
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _authController.submitForm();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
