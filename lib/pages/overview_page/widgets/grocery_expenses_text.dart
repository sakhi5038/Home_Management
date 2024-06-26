import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryExpensesText extends ConsumerWidget {
  const GroceryExpensesText({
    super.key,
    required this.groceryExpense,
  });
  final num groceryExpense;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Grocery Expenses : ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.035,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: groceryExpense.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.04,
                fontFamily: 'California',
              ),
            )
          ],
        ),
      ),
    );
  }
}
