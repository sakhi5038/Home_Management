// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';

import 'package:flutter_project_home_manager/pages/utilities_page/widgets/add_button_in_dialog.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/date_picker_dialog.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/dialog_text.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/drop_down_menu_button.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/payment_text_form_field.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/widgets/update_button_in_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DialogCallType { addNewBill, udateExistingBill }
class UtiltiyPageDialog extends ConsumerWidget {
  final DialogCallType dialogCallType;

  const UtiltiyPageDialog({super.key, required this.dialogCallType});
  @override
  

  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(utilityPageProvider.notifier);
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * 0.8,
        height: height * 0.5,
        child: Material(
          color: Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.08),
              color: Colors.blue.shade200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 2),
                const Expanded(flex: 4, child: DialogText(text: 'Paid Date')),
                const Spacer(),
                const Expanded(flex: 8, child: DialogBillDatePicker()),
                const Spacer(flex: 4),
                const Expanded(flex: 4, child: DialogText(text: 'Bill Type')),
                const Spacer(),
                const Expanded(flex: 8, child: DropDownBillButton()),
                const Spacer(flex: 4),
                const Expanded(flex: 4, child: DialogText(text: 'Paid Amount')),
                const Spacer(),
                Expanded(flex: 12, child: PaymentTextFormField(width: width)),
                const Spacer(flex: 4),
                Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          return switch (dialogCallType) {
                            DialogCallType.addNewBill =>
                              AddItemDialogButton(dialogContext: context),
                            DialogCallType.udateExistingBill =>
                              UpdateItemDialogButton(
                                dialogContext: context,
                              ),
                          };
                        }),
                        InkWell(
                          onTap: () async {
                            var dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 3645)));
                            var time = await showTimePicker(                                
                                context: context,
                                initialTime:
                                    const TimeOfDay(hour: 12, minute: 00));
                            if (dateTime != null) {
                              var updatedDate = dateTime.copyWith(
                                  hour: time?.hour ?? 12,
                                  minute: time?.minute ?? 00);
                              notifier.scheduleNotification(updatedDate);
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.notification_add,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    )),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
