import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/weather_page/controller/weather_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherInputField extends ConsumerWidget {
  const WeatherInputField({super.key});

  static const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(
    20,
  )));
  static const textFieldWidth = 0.7;
  static const lableText = 'City Name';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * textFieldWidth,
      child: TextFormField(
          decoration: const InputDecoration(
            labelText: lableText,
            border: border,
            focusedBorder: border,
            enabledBorder: border,
          ),
          controller: ref.read(weatherProvider.notifier).weatherController),
    );
  }
}
