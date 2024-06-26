import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/error_page/error_page.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/view/grocreis_page.dart';
import 'package:flutter_project_home_manager/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter_project_home_manager/pages/home_page/widgets/bottom_navigation_bar.dart';
import 'package:flutter_project_home_manager/pages/overview_page/view/overview_page.dart';
import 'package:flutter_project_home_manager/pages/profile_page/view/profile_page.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utilities_page.dart';
import 'package:flutter_project_home_manager/pages/weather_page/view/weather_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const pageAddress = '/';
  static const _firstPageIndex = 0;
  static const _secondPageIndex = 1;
  static const _thirdPageIndex = 2;
  static const _fourthPageIndex = 3;
  static const _fifthPageIndex = 4;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(homePageProvider.notifier);
    ref.watch(homePageProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Builder(
            builder: (context) {
              return switch (controller.currentIndex) {
                _firstPageIndex => const OverviewPage(),
                _secondPageIndex => const GroceryPage(),
                _thirdPageIndex => const WeatherPage(),
                _fourthPageIndex => const UtilityPage(),
                _fifthPageIndex => const ProfilePage(),
                _ => const ErrorPage(),
              };
            },
          ),
          const HomePageBottomNavigationBar(),
        ]),
      ),
    );
  }
}
