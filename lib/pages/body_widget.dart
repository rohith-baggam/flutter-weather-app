import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/aditional_information.dart';
import 'package:weather_app/widgets/inner_card.dart';
import 'package:weather_app/widgets/main_card_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // main card
          MainCardWidget(),

          SizedBox(height: 16),
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // weather forcast
          // Row scrollable widget
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: HourlyForecastWidget(
                    icon: Icons.cloud,
                    time: "00:00",
                    temperature: "301.22",
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: HourlyForecastWidget(
                    icon: Icons.sunny,
                    time: "03:00",
                    temperature: "300.52",
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: HourlyForecastWidget(
                    icon: Icons.cloud,
                    time: "06:00",
                    temperature: "302.22",
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: HourlyForecastWidget(
                    icon: Icons.sunny,
                    time: "09:00",
                    temperature: "300.12",
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: HourlyForecastWidget(
                    icon: Icons.cloud,
                    time: "21:00",
                    temperature: "299.8",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Additional Information",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // additional information
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdditionInfoWidget(
                icon: Icons.water_drop,
                label: "Humidity",
                value: "91",
              ),
              AdditionInfoWidget(
                icon: Icons.air,
                label: "Wind Speed",
                value: "7.5",
              ),
              AdditionInfoWidget(
                icon: Icons.beach_access,
                label: "Pressure",
                value: "1000",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
