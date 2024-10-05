import 'package:flutter/material.dart';
import 'package:frontend/views/donor/home.dart';
import 'package:frontend/views/ngo/home.dart';
import 'package:frontend/views/select_user.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DonorHome(),
    );
  }
}
