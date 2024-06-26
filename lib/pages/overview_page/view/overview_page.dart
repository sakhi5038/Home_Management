import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/overview_loaded_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});
  static const pageAddress = '/overviewPage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(overviewPageProvider.notifier);
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.getExpenses();
      },
    );
    return const Scaffold(
      body: OverViewWidget(),
    );
  }
}
