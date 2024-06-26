import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/widgets/add_new_item_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewItemCenterDesign extends ConsumerWidget {
  const AddNewItemCenterDesign({super.key, required this.validator});
  static const priceHint = 'Item Price';
  static const menuHint = 'Category';
  static const menuEntryOne = 'Dairy';
  static const menuEntryTwo = 'Food';
  static const menuEntryThree = 'Fruit';
  static const menuEntryFour = 'Cosmetics';
  static const menuEntryFive = 'Household';
  static const menuEntryOthers = 'Others';

  final FormFieldValidator<String?> validator;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantityProvider = ref.read(groceriesProvider.notifier);
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: AddNewItemTextField(
                  fieldSize: 0.3,
                  keyBoardType: TextInputType.number,
                  lableText: priceHint,
                  controller: quantityProvider.controllerForItemPrice,
                  validator: validator),
            )),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.035),
                child: DropdownMenu(
                    requestFocusOnTap: false,
                    controller: quantityProvider.controlllerForDropDownMenu,
                    width: width * 0.4,
                    textStyle: const TextStyle(color: Colors.white),
                    inputDecorationTheme: const InputDecorationTheme(
                        suffixIconColor: Colors.white,
                        iconColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        activeIndicatorBorder: BorderSide(color: Colors.white)),
                    enableFilter: true,
                    enableSearch: true,
                    hintText: menuHint,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                          value: menuEntryOne, label: menuEntryOne),
                      DropdownMenuEntry(
                          value: menuEntryTwo, label: menuEntryTwo),
                      DropdownMenuEntry(
                          value: menuEntryThree, label: menuEntryThree),
                      DropdownMenuEntry(
                          value: menuEntryFour, label: menuEntryFour),
                      DropdownMenuEntry(
                          value: menuEntryFive, label: menuEntryFive),
                      DropdownMenuEntry(
                          value: menuEntryOthers, label: menuEntryOthers),
                    ]),
              ),
            ))
      ],
    );
  }
}
