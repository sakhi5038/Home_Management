import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/model/utility_bill_item.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UtiiltiesPageList extends ConsumerWidget {
  const UtiiltiesPageList({super.key});
  static const _updateBtnText = 'Update bill';
  static const _deleteBtnText = 'Delete bill';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    var controller = ref.read(utilityPageProvider.notifier);
    ref.watch(utilityPageProvider);
    var listOfBills = controller.listOfItems;
    return ListView.builder(
      itemCount: listOfBills.length,
      itemBuilder: (context, index) {
        UtiltityBillItem currentItem = listOfBills[index];
        if (index == listOfBills.length - 1) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.05),
                      border: Border.all(color: Colors.blue)),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.05)),
                    leading: Icon(controller
                        .iconAgainstBillCatogary(currentItem.billType)),
                    title: Text(
                      currentItem.billType.toString(),
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.05),
                    ),
                    subtitle: Text(
                      currentItem.dateTime.convertToString(),
                      style: TextStyle(
                          color: Colors.blueAccent, fontSize: width * 0.04),
                    ),
                    // shape: const CircleBorder(),
                    trailing: Text(
                      currentItem.paidAmount.toString(),
                      style: TextStyle(
                          color: Colors.blueGrey, fontSize: width * 0.05),
                    ),
                    expansionAnimationStyle: AnimationStyle(
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 1)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.05)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppCommonButton(
                                width: width * 0.4,
                                backgroundColor: Colors.blue,
                                buttonText: _updateBtnText,
                                onClick: () {
                                  controller.listItemUpdate(context, index);
                                },
                                buttonIcon: Icons.update),
                            AppCommonButton(
                                width: width * 0.4,
                                backgroundColor: Colors.red,
                                buttonText: _deleteBtnText,
                                onClick: () {
                                  controller.listItemDelete(context, index);
                                },
                                buttonIcon: Icons.delete),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.23,
              )
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: Colors.blue)),
            child: ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.05)),
              leading: Icon(
                  controller.iconAgainstBillCatogary(currentItem.billType)),
              title: Text(
                currentItem.billType.toString(),
                style: TextStyle(color: Colors.black, fontSize: width * 0.05),
              ),
              subtitle: Text(
                currentItem.dateTime.convertToString(),
                style:
                    TextStyle(color: Colors.blueAccent, fontSize: width * 0.04),
              ),
              // shape: const CircleBorder(),
              trailing: Text(
                currentItem.paidAmount.toString(),
                style:
                    TextStyle(color: Colors.blueGrey, fontSize: width * 0.05),
              ),
              expansionAnimationStyle: AnimationStyle(
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.05)),
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppCommonButton(
                          width: width * 0.4,
                          backgroundColor: Colors.blue,
                          buttonText: _updateBtnText,
                          onClick: () {
                            controller.listItemUpdate(context, index);
                          },
                          buttonIcon: Icons.update),
                      AppCommonButton(
                          width: width * 0.4,
                          backgroundColor: Colors.red,
                          buttonText: _deleteBtnText,
                          onClick: () {
                            controller.listItemDelete(context, index);
                          },
                          buttonIcon: Icons.delete),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
