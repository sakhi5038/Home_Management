import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dialog_body.dart';

class UpdateDialog extends StatelessWidget {
  final int totalItem , usedItem;
  const UpdateDialog({super.key, required this.index , required this.totalItem , required this.usedItem,});

  static const _dialogWidth = 0.8;
  static const _dialogHeight = 0.25;
  static const _borderRadius = 20.0;

  final int index;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * _dialogWidth,
        height: height * _dialogHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: DialogBody(index: index,totalItem: totalItem,usedItem: usedItem,),
        ),
      ),
    );
  }
}
