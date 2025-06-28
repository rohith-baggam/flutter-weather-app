import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/pages/body_widget.dart';
import 'package:http/http.dart' as http;

// default 6e895ca36a4ab63193c8c03a481bfb87

// created 25cfa684aded55c6d5095ffbff91f352

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = "London";
    try {
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=6e895ca36a4ab63193c8c03a481bfb87",
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw data['message'];
      }
      return data;
      // temperature = data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // GestureDetector(child: Icon(Icons.refresh), onTap: () => {print('refresh')}),
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: BodyWidget(future: weather),
    );
  }
}
