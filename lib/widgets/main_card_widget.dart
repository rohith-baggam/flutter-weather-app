import 'dart:ui';

import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  final double temperature;
  final String currentSky;
  const MainCardWidget({
    super.key,
    required this.temperature,
    required this.currentSky,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "$temperature°K",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Icon(
                    currentSky == "Clouds" || currentSky == "Rain"
                        ? Icons.cloud
                        : Icons.sunny,
                    size: 64,
                  ),
                  SizedBox(height: 16),
                  Text(currentSky, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
