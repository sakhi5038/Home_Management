import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier_states.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/update_dialog_row_design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogBody extends ConsumerWidget {
  final int totalItem, usedItem;
  const DialogBody({
    super.key,
    required this.index,
    required this.totalItem,
    required this.usedItem,
  });
  
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    var notifier = ref.read(groceriesProvider.notifier);
    notifier.setInitials(index, totalItem, usedItem);    
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: UpdateDialogTotalItemRow(index: index, totalItem: totalItem),
        ),
        Expanded(
            flex: 1,
            child: UpdateDialogUsedItemRow(index: index, usedItem: usedItem)),
      ],
    );
  }
}

class UpdateDialogTotalItemRow extends ConsumerWidget {
  final int totalItem;
  final int index;
  static const totalItems = 'Total Items';
  const UpdateDialogTotalItemRow({
    super.key,
    required this.index,
    required this.totalItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(groceriesProvider.notifier);
    var state = ref.watch(groceriesProvider);
    int total = totalItem;
    if (state is GroceryUpdateDialogState) {
      total = state.total;
    }
    return UpdateDialogRowDesign(
        index: index,
        text: totalItems,
        onAddBtnTap: () {
          notifier.incrementTotal();
        },
        onMinusBtnTap: () {
          notifier.decrementTotal();
        },
        quantityText: total);
  }
}


class UpdateDialogUsedItemRow extends ConsumerWidget {
  static const usedItems = 'Used Items';
  final int usedItem;
  final int index;
  
  const UpdateDialogUsedItemRow({
    super.key,
    required this.index,
    required this.usedItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(groceriesProvider.notifier);
    var state = ref.watch(groceriesProvider);
    int used = usedItem;
    if (state is GroceryUpdateDialogState) {
      used = state.used;
    }
    return UpdateDialogRowDesign(
        index: index,
        text: usedItems,
        onAddBtnTap: () {
          notifier.incrementUsed();
        },
        onMinusBtnTap: () {
          notifier.decrementUsed();
        },
        quantityText: used);
  }
}


class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.white,
        size: height * 0.025,
      ),
    );
  }
}
