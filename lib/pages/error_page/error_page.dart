import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  static const pageAddress = '/errorPage';
  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 108, 185, 241),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        backgroundColor: const Color.fromARGB(255, 108, 185, 241),
        body: Center(
          child: SizedBox(
              width: width,
              child: Lottie.asset('assets/lottie/error_page.json')),
        ),
      ),
    );
  }
}
