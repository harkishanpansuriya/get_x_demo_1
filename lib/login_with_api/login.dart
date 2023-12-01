import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var token = ''.obs;
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        token.value = responseData['token'];
        isLoggedIn.value = true;
        Get.snackbar('Success', 'Login successful',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Login failed',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'An error occurred',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    isLoggedIn.value = false;
    token.value = '';
  }
}

class LoginPageScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Login Flow"),
      body: Center(
        child: Obx(() {
          if (!_authController.isLoggedIn.value) {
            return LoginForm();
          } else {
            return LoggedInScreen();
          }
        }),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthController _authController = Get.find();

  final TextEditingController _emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _passwordController =
      TextEditingController(text: "cityslicka");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        Obx(
          () => ElevatedButton(
            onPressed: _authController.isLoading.value
                ? null
                : () {
                    _authController.login(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
            child: _authController.isLoading.value
                ? const CircularProgressIndicator()
                : const Text('Login'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class LoggedInScreen extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Logged in with token: ${_authController.token.value}'),
        ElevatedButton(
          onPressed: () {
            _authController.logout();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
