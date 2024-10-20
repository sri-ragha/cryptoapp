import 'package:crypto_app/components/bottomnav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: BottomNavigation(),
    );
  }
}
