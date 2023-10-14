import 'package:flutter/material.dart';
import 'package:weather/service/dio.dart';
import 'package:weather/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}

