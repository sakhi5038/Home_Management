import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dailog.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_delete_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryListTile extends ConsumerWidget {
  const GroceryListTile({
    super.key,
    required this.groceryItem,
    required this.index,
  });
  final GroceryModel groceryItem;
  final int index;
  static const updateDetailsbtnText = 'Update Details';
  static const deleteItembtnText = 'Delete Item';
  static const borderRadius = 20.0;
  static const _boxWidth = 0.95;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('[Id : ${groceryItem.id}]');
    var notifier = ref.read(groceriesProvider.notifier);
    ref.watch(groceriesProvider);
    final shouldExpand = notifier.currentTileIndex == index;
    final Size(:width) = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: width * _boxWidth,
        child: ExpansionTile(
          leading: ListTileLeading(
              itemName: groceryItem.itemName,
              totalQuantity: groceryItem.totalQuantity),
          initiallyExpanded: shouldExpand,
          onExpansionChanged: (value) {},
          textColor: Colors.white,
          collapsedTextColor: Colors.white,
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          collapsedShape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          collapsedBackgroundColor: Colors.blue.shade300,
          backgroundColor: Colors.blue.shade300,
          title: ListTileTrailing(
            icon: groceryItem.icon,
            remaining: groceryItem.usedQuantity,
          ),
          children: [
            ListTile(
              title: Center(
                child: Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: UpdateDeleteButton(
                            btnText: updateDetailsbtnText,
                            onBtnTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return UpdateDialog(
                                    index: index,
                                    totalItem: groceryItem.totalQuantity,
                                    usedItem: groceryItem.usedQuantity,
                                  );
                                },
                              );
                              notifier.updateGrocery();
                            },
                          ),
                        )),
                    const Spacer(),
                    Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: UpdateDeleteButton(
                              onBtnTap: () {
                                notifier.deleteGrocery(groceryItem);
                              },
                              btnText: deleteItembtnText),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTileLeading extends StatelessWidget {
  const ListTileLeading(
      {super.key, required this.itemName, required this.totalQuantity});
  final String itemName;
  final int totalQuantity;
  static const _boxWidth = 0.5;
  static const _boxHeight = 0.1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(color: Colors.white, fontSize: height * 0.023);
    return SizedBox(
      width: width * _boxWidth,
      height: height * _boxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  itemName,
                  style: textStyle,
                ),
              )),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Total: $totalQuantity', style: textStyle))),
        ],
      ),
    );
  }
}

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing(
      {super.key, required this.icon, required this.remaining});
  final IconData icon;
  final int remaining;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    final textStyle = TextStyle(color: Colors.white, fontSize: height * 0.02);
    return SizedBox(
      height: height * 0.1,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              size: height * 0.03,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                'Used:$remaining',
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
