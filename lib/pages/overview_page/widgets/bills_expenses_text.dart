import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillsExpensesText extends ConsumerWidget {
  const BillsExpensesText({super.key, required this.utitliyExpense});
  final num utitliyExpense;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Bills Expenses : ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.035,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: utitliyExpense.toString(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'California',
                fontSize: height * 0.04,
              ),
            )
          ],
        ),
      ),
    );
  }
}
