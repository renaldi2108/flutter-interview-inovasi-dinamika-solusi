part of '../main.dart';

class AuthController extends GetxController {
  final username = ''.obs;
  final password = ''.obs;

  void login() {
    if (username.value.isNotEmpty && password.value.length >= 6) {
      Get.offNamed('/dashboard');
    } else {
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
