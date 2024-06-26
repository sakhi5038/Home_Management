import 'package:flutter/material.dart';

class WeatherInfoContainer extends StatelessWidget {
  const WeatherInfoContainer(
      {super.key,
      required this.humidity,
      required this.maxTemperature,
      required this.description,
      required this.minTemperature});
  final int humidity, maxTemperature, minTemperature;
  final String description;
  static const _containerWidth = 0.8;
  static const _containerHeight = 0.35;
  static const textsSpacingFromLeft = 0.05;

  static const humidityName = 'Humidity';
  static const maxTemp = 'Max Temperature';
  static const minTemp = 'Min Temperature';
  static const descrp = 'Description';

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * _containerWidth,
      height: height * _containerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: WeatherValues(
                paddingFromLeft: width * textsSpacingFromLeft,
                name: humidityName,
                value: '$humidity%',
              )),
          Expanded(
            flex: 1,
            child: WeatherValues(
              paddingFromLeft: width * textsSpacingFromLeft,
              name: maxTemp,
              value: '$maxTemperature°C',
            ),
          ),
          Expanded(
            flex: 1,
            child: WeatherValues(
              paddingFromLeft: width * textsSpacingFromLeft,
              name: descrp,
              value: description,
            ),
          ),
          Expanded(
            flex: 1,
            child: WeatherValues(
              paddingFromLeft: width * textsSpacingFromLeft,
              name: minTemp,
              value: '$minTemperature°C',
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherValues extends StatelessWidget {
  const WeatherValues(
      {super.key,
      required this.name,
      required this.value,
      required this.paddingFromLeft});
  final String name, value;
  final double paddingFromLeft;

  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final valueStyle = TextStyle(color: Colors.black, fontSize: height * 0.022);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.only(left: paddingFromLeft),
                child: Text(
                  '$name:',
                  style: valueStyle.copyWith(fontSize: height * 0.022),
                ))),
        Expanded(
            flex: 1,
            child: Text(
              value,
              style: valueStyle,
            )),
      ],
    );
  }
}
