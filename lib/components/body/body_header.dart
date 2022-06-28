import 'package:flutter/material.dart';

Widget bodyHeader() => Container(
      child: ListTile(
        title: Text(
          'Lista Crypto',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Basato sulla top 100'),
        trailing: Text('Mostra tutte'),
      ),
    );
