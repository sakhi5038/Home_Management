import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dialog_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateDialogRowDesign extends ConsumerWidget {
  const UpdateDialogRowDesign(
      {super.key,
      required this.index,
      required this.text,
      required this.onAddBtnTap,
      required this.onMinusBtnTap,
      required this.quantityText});
  final String text;
  final int index, quantityText;
  final VoidCallback onAddBtnTap, onMinusBtnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final textsStyle = TextStyle(color: Colors.white, fontSize: height * 0.02);
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              text,
              style: textsStyle,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: MyButton(onTap: onAddBtnTap, icon: Icons.add),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              quantityText.toString(),
              style: textsStyle.copyWith(fontSize: height * 0.02),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: MyButton(onTap: onMinusBtnTap, icon: Icons.remove),
        ),
        const Spacer()
      ],
    );
  }
}
