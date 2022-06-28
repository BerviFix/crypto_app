import 'package:flutter/material.dart';

Widget bodyContent() => Expanded(
      child: Container(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) => ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text(
              'BTC',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Bitcoin',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\€ 2000",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "+0,5%",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
