import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_new_item_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewItemButton extends ConsumerWidget {
  const AddNewItemButton({super.key});

  static const _btnWidth = 0.16;
  static const _btnHeight = 0.09;

  static const shadowOffset = Offset(1, 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AddNewExpenseItemDialog();
          },
        );
      },
      child: SizedBox(
          width: width * _btnWidth,
          height: height * _btnHeight,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}
