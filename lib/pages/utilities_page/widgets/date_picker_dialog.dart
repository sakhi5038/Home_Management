import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/dialog_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogBillDatePicker extends ConsumerWidget {
  const DialogBillDatePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width * 0.7;
    ref.watch(utilityPageProvider);
    var controller = ref.read(utilityPageProvider.notifier);
    DateTime? dateTime = controller.date;
    log('date picker dialog rebuild ${dateTime.toString()}');
    String dateText = '${dateTime.day} - ${dateTime.month} - ${dateTime.year}';
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogText(text: dateText),
          IconButton(
            onPressed: () async {
              dateTime = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2024, 1, 1),
                  lastDate: DateTime.now());
              controller.updateDateTime(dateTime ?? DateTime.now());
            },
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.white,
              shadows: [
                BoxShadow(color: Colors.black, offset: Offset(1, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
