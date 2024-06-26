import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_item_button.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_body_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryPage extends ConsumerWidget {
  const GroceryPage({super.key});

  static const _buttonSpacingFromRight = 0.05;
  static const _buttonSpacingFromBottom = 0.14;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) => ref.read(groceriesProvider.notifier).fetchList());
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox.expand(
            child: Stack(
              children: [
                const GroceryBodyWidget(),
                Positioned(
                    bottom: height * _buttonSpacingFromBottom,
                    right: width * _buttonSpacingFromRight,
                    child: const AddNewItemButton())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
