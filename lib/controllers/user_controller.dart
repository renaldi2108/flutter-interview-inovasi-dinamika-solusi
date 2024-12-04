part of '../main.dart';

class UserController extends GetxController {
  var requestState = RequestState.initial.obs;
  var userList = <User>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      requestState(RequestState.loading);
      var users = await ApiService.fetchUsers();
      if (users.isNotEmpty) {
        userList.assignAll(users);
      }
    } catch(exception) {
      requestState(RequestState.failed);
      error.value = 'Failed to load';
    } finally {
      requestState(RequestState.loaded);
    }
  }
}
