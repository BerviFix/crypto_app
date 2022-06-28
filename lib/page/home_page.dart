import 'package:crypto_app/themes/colors.dart';
import 'package:flutter/material.dart';

import '../components/home_page/app_bar.dart';
import '../components/home_page/body.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      appBar: appBar(),
      body: body(),
    );
  }
}
