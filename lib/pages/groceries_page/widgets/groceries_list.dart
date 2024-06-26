import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/grocery_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceriesList extends ConsumerWidget {
  const GroceriesList({super.key, required this.groceries});
  final List<GroceryModel> groceries;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, index) {
        if (index == groceries.length - 1) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: GroceryListTile(
                  index: index,
                  groceryItem: groceries[index],
                ),
              ),
              SizedBox(
                height: height * 0.23,
              )
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: height * 0.01),
          child: GroceryListTile(
            index: index,
            groceryItem: groceries[index],
          ),
        );
      },
    );
  }
}
