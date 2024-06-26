import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Flutter code sample for [DropdownButton].

class DropDownBillButton extends ConsumerWidget {
  const DropDownBillButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(utilityPageProvider.notifier);
    ref.watch(utilityPageProvider);
    String dropdownValue = controller.billType;
    return DropdownButton<String>(
      dropdownColor: Colors.blueAccent,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: controller.onDropDownValueChange,
      items: controller.listOfBillCatogaries
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
