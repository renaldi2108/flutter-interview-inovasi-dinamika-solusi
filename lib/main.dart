import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myproject/util/enum/state/request_state.dart';
import 'package:myproject/util/json_utils.dart';

part 'controllers/user_controller.dart';
part 'controllers/auth_controller.dart';
part 'models/user_model.dart';
part 'services/api_service.dart';
part 'pages/dashboard/dashboard_page.dart';
part 'pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () => DashboardPage()),
      ],
    );
  }
}