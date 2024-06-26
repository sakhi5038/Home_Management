import 'package:flutter/material.dart';

class GetWeatherButton extends StatelessWidget {
  const GetWeatherButton({super.key, required this.onBtnTap});

  static const btnText = 'Get Weather';

  final VoidCallback onBtnTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onBtnTap,
        child: const Text(
          btnText,
        ));
  }
}
