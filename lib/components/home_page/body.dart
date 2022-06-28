import 'package:crypto_app/themes/colors.dart';
import 'package:flutter/material.dart';

import '../body/body_header.dart';
import '../body/body_content.dart';

Widget body() => Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: ThemeColors.cardBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          bodyHeader(),
          Divider(),
          bodyContent(),
        ],
      ),
    );
