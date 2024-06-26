import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateDeleteButton extends ConsumerWidget {
  const UpdateDeleteButton(
      {super.key, required this.onBtnTap, required this.btnText});
  final String btnText;
  final VoidCallback onBtnTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return ElevatedButton(
        onPressed: onBtnTap,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(height * 0.1),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
          textStyle:
              WidgetStatePropertyAll(TextStyle(color: Colors.blue.shade400)),
        ),
        child: Text(
          btnText,
          style: TextStyle(color: Colors.blue.shade400),
        ));
  }
}
