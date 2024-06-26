import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/weather_page/widgets/weather_info_box.dart';

class WeatherLoadedWidget extends StatelessWidget {
  const WeatherLoadedWidget({
    super.key,
    required this.backGroundColor,
    required this.animation,
    required this.cityName,
    required this.temperature,
    required this.icon,
    required this.main,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
    required this.descrp,
  });
  final Color backGroundColor;
  final Animation<double> animation;
  final String cityName, icon, main, descrp;
  final int temperature, humidity, maxTemp, minTemp;
  //positioning values
  static const cityNameSpacingFromTop = 0.15;
  static const tempSpacingFromTop = 0.2;
  static const imageSpacingFromTop = 0.07;
  static const descriptionSpacingFromTop = 0.26;
  static const cityNameSpacingFromLeft = 0.1;
  static const tempSpacingFromLeft = 0.1;
  static const imageSpacingFromRight = 0.1;
  static const descriptionSpacingFromRight = 0.21;
  static const infoBoxSpacingFromRight = 0.0;
  static const infoBoxSpacingFromBottom = 0.23;
  //image box
  static const imageWidthAndHeight = 0.3;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final cityNameStyle = TextStyle(
        color: Colors.white,
        fontSize: height * 0.04,
        fontFamily: 'California',
        fontWeight: FontWeight.bold);
    final tempStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'California',
      fontSize: height * 0.08,
    );
    return SizedBox.expand(
      child: Stack(
        children: [
          FadeTransition(
            opacity: animation,
            child: Container(
              color: backGroundColor,
            ),
          ),
          Positioned(
              top: height * cityNameSpacingFromTop,
              left: width * cityNameSpacingFromLeft,
              child: Text(
                cityName,
                style: cityNameStyle,
              )),
          Positioned(
              top: height * tempSpacingFromTop,
              left: width * tempSpacingFromLeft,
              child: Text(
                '$temperature°C',
                style: tempStyle,
              )),
          Positioned(
              top: height * imageSpacingFromTop,
              right: width * imageSpacingFromRight,
              child: SizedBox(
                width: width * imageWidthAndHeight,
                height: height * imageWidthAndHeight,
                child: Image.network(
                  _fetchImage(icon),
                  filterQuality: FilterQuality.high,
                ),
              )),
          Positioned(
              top: height * descriptionSpacingFromTop,
              right: width * descriptionSpacingFromRight,
              child: Text(main)),
          Positioned(
              bottom: height * infoBoxSpacingFromBottom,
              right: width * infoBoxSpacingFromRight,
              child: WeatherInfoContainer(
                humidity: humidity,
                maxTemperature: maxTemp,
                minTemperature: minTemp,
                description: descrp,
              ))
        ],
      ),
    );
  }

  String _fetchImage(String icon) =>
      'http://openweathermap.org/img/wn/$icon@2x.png';
}
