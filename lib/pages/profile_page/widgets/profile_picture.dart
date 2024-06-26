import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: width * 0.1,
        child: Icon(
          Icons.person,
          size: width * 0.08,
        ),
      ),
    );
  }
}
