import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/pages/body_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBarWidget().getAppBar();

    return Scaffold(appBar: appBar, body: BodyWidget());
  }
}
