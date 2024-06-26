import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentTextFormField extends ConsumerWidget {
  final double width;
  const PaymentTextFormField({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(utilityPageProvider.notifier);
    return Form(
      key: controller.dialogKey,
      child: AppCommonField(
        prefixIcon: Icons.payment,
        inputTextColor: Colors.white,
        textType: TextInputType.number,
        width: width * 0.7,
        value: controller.paidAmount,
        borderRadius: width * 0.04,
        controller: controller.paymentController,
        label: 'payment',
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
    );
  }
}
