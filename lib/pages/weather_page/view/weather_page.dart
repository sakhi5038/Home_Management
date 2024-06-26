import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/weather_page/controller/states.dart';
import 'package:flutter_project_home_manager/pages/weather_page/controller/weather_notifier.dart';
import 'package:flutter_project_home_manager/pages/weather_page/widgets/get_weather_button.dart';
import 'package:flutter_project_home_manager/pages/weather_page/widgets/weather_input_field.dart';
import 'package:flutter_project_home_manager/pages/weather_page/widgets/weather_loaded_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherPage extends ConsumerStatefulWidget {
  const WeatherPage({
    super.key,
  });
  @override
  ConsumerState<WeatherPage> createState() => _WeatherLoadedWidgetState();
}

class _WeatherLoadedWidgetState extends ConsumerState<WeatherPage>
    with TickerProviderStateMixin {
  //constant values
  static const heading = 'Live Weather';
  static const headingSpacingFromTop = 0.06; 
  static const inputFieldSpacingFormTop = 0.32;
  static const clear = 'Clear';
  static const rain = 'Rain';
  static const drizzle = 'Drizzle';
  static const clouds = 'Clouds';
  static const haze = 'Haze';

  //controller
  late AnimationController _controller;
  //animation
  late Animation<double> animation;
  final tweenForAnmiation = Tween<double>(begin: 0.2, end: 1.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..forward();

    animation = tweenForAnmiation.animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var previousColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: height * 0.045,
        fontFamily: 'California');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  var state = ref.watch(weatherProvider);
                  if (state is InitialState) {
                    return Container(
                      color: previousColor,
                    );
                  } else if (state is NetworkErrorState) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.networkErrorMessage)));
                      },
                    );
                    return Container(
                      color: previousColor,
                    );
                  } else if (state is ErrorState) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)));
                      },
                    );
                    return Container(
                      color: previousColor,
                    );
                  } else if (state is WeatherLoadedState) {
                    previousColor =
                        checkColor(state.weatherInfo.weather[0].main);
                    return WeatherLoadedWidget(
                      backGroundColor:
                          checkColor(state.weatherInfo.weather[0].main),
                      animation: animation,
                      cityName: state.weatherInfo.name,
                      temperature:
                          _convertKelvinToCelsius(state.weatherInfo.main.temp)
                              .toInt(),
                      icon: state.weatherInfo.weather[0].icon,
                      main: state.weatherInfo.weather[0].main,
                      humidity: state.weatherInfo.main.humidity,
                      maxTemp: _convertKelvinToCelsius(
                              state.weatherInfo.main.tempMax)
                          .toInt(),
                      minTemp: _convertKelvinToCelsius(
                              state.weatherInfo.main.tempMin)
                          .toInt(),
                      descrp: state.weatherInfo.weather[0].description,
                    );
                  } else {
                    return Container(
                      color: previousColor,
                    );
                  }
                },
              ),
              Positioned(
                  top: height * headingSpacingFromTop,
                  child: Text(
                    heading,
                    style: textStyle,
                  )),
              Positioned(
                top: height * inputFieldSpacingFormTop,
                child: const WeatherInputField(),
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetWeatherButton(onBtnTap: _onBtnTap),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Color checkColor(String main) => switch (main) {
        clear => Colors.blue.shade200,
        rain => Colors.blueGrey.shade300,
        drizzle => Colors.blue,
        clouds => Colors.grey.shade300,
        haze => Colors.purple.shade100,
        _ => Colors.grey,
      };

  void _onBtnTap() {
    ref.read(weatherProvider.notifier).fetchWeather();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = tweenForAnmiation.animate(_controller);
    _controller.forward();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  double _convertKelvinToCelsius(double temperature) => temperature - 273;
}
