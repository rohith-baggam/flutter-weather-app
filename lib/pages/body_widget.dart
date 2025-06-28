import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/aditional_information.dart';
import 'package:weather_app/widgets/inner_card.dart';
import 'package:weather_app/widgets/main_card_widget.dart';

class BodyWidget extends StatelessWidget {
  final Future future;
  const BodyWidget({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        final data = snapshot.data;
        final results = data['list'];
        final currentWeatherData = data['list'][0];
        final currentTemperature = currentWeatherData['main']['temp'];
        final currentSky = currentWeatherData['weather'][0]['main'];
        final currentPressure = currentWeatherData['main']['pressure']
            .toString();
        final currentWindSpeed = currentWeatherData['wind']['speed'].toString();
        final currentHumidity = currentWeatherData['main']['humidity']
            .toString();

        return BodyPaddingWidget(
          temperature: currentTemperature,
          currentSky: currentSky,
          currentPressure: currentPressure,
          currentWindSpeed: currentWindSpeed,
          currentHumidity: currentHumidity,
          results: results,
        );
      },
    );
  }
}

class BodyPaddingWidget extends StatelessWidget {
  const BodyPaddingWidget({
    super.key,
    required this.temperature,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.results,
  });

  final double temperature;
  final String currentSky;
  final String currentPressure;
  final String currentWindSpeed;
  final String currentHumidity;
  final List<dynamic> results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // main card
          MainCardWidget(temperature: temperature, currentSky: currentSky),

          SizedBox(height: 16),
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // weather forcast
          // Row scrollable widget
          WeatherForecastScrollWidget(results: results),
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
                value: currentHumidity,
              ),
              AdditionInfoWidget(
                icon: Icons.air,
                label: "Wind Speed",
                value: currentWindSpeed,
              ),
              AdditionInfoWidget(
                icon: Icons.beach_access,
                label: "Pressure",
                value: currentPressure,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherForecastScrollWidget extends StatelessWidget {
  const WeatherForecastScrollWidget({super.key, required this.results});
  final List<dynamic> results;

  List<SizedBox> getWeatherForecast() {
    List<SizedBox> data = [];
    for (int i = 1; i < 10; i++) {
      dynamic mainData = results[i]['main'];
      final weather = results[i]['weather'][0]['main'].toString();
      final time = DateTime.parse(results[i]['dt_txt']);
      data.add(
        SizedBox(
          width: 100,
          child: HourlyForecastWidget(
            icon: weather == "Clouds" || weather == "Rain"
                ? Icons.cloud
                : Icons.sunny,
            time: DateFormat.Hm().format(time),
            temperature: mainData['temp'].toString(),
          ),
        ),
      );
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(children: getWeatherForecast()),
    // );
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: 30,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final hourlyForecast = results[index + 1];
          final weather = hourlyForecast['weather'][0]['main'].toString();
          return HourlyForecastWidget(
            time: hourlyForecast['dt_txt'].toString().substring(11, 16),
            temperature: hourlyForecast['main']['temp'].toString(),
            icon: weather == "Clouds" || weather == "Rain"
                ? Icons.cloud
                : Icons.sunny,
          );
        },
      ),
    );
  }
}
