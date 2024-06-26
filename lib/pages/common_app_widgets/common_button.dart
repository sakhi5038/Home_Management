import 'package:flutter/material.dart';

class AppCommonButton extends StatelessWidget {
  const AppCommonButton(
      {super.key,
      required this.width,
      required this.backgroundColor,
      required this.buttonText,
      required this.onClick,
      required this.buttonIcon});
  final double width;
  final Color backgroundColor;
  final void Function()? onClick;
  final String buttonText;
  final IconData buttonIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(buttonIcon, color: Colors.white),
            SizedBox(
              width: width * 0.5,
              height: width * 0.15,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Text(
                    buttonText,
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
