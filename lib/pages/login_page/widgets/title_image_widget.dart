import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TitleIconWidget extends StatelessWidget {
  const TitleIconWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Hero(
          tag: 'tissue',
          child: Lottie.asset('assets/lottie/Savings.json'),
        ),
      ),
    );
  }
}
