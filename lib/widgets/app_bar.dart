import 'package:flutter/material.dart';

class AppBarWidget {
  AppBar getAppBar() {
    return AppBar(
      title: Text("Weather App", style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        // GestureDetector(child: Icon(Icons.refresh), onTap: () => {print('refresh')}),
        IconButton(
          onPressed: () {
            print('refresh');
          },
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }
}
