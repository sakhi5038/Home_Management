import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/controller/home_page_controller.dart';
import 'package:flutter_project_home_manager/utils/bottom_navigation_bar_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageBottomNavigationBar extends ConsumerStatefulWidget {
  const HomePageBottomNavigationBar({super.key});


  @override
  ConsumerState<HomePageBottomNavigationBar> createState() {
    return _HomePageBottomNavigationBarState();
  }
  
  }
  // icon labels

  class _HomePageBottomNavigationBarState extends ConsumerState<HomePageBottomNavigationBar>{

    late NotchBottomBarController controller;

    @override
  void initState() {    
    super.initState();
    var notifier = ref.read(homePageProvider.notifier);
    controller = NotchBottomBarController(index: notifier.currentIndex) ;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var notifier = ref.read(homePageProvider.notifier);
    var Size(:width, :height) = MediaQuery.sizeOf(context);    
    return AnimatedNotchBottomBar(      
      removeMargins: true,
      notchColor: Colors.white,
      elevation: 0,      
      color: Colors.white,
      bottomBarWidth: MediaQuery.of(context).size.width,
      bottomBarHeight: height * 0.1,
      notchBottomBarController: controller,
      onTap: (value) {notifier.onStateChange(value);
        controller.jumpTo(value);
      },
      bottomBarItems: BottomNavigationBarItems.listOfBottomBarItems,
      kBottomRadius: 0,
      kIconSize: width * 0.06,
    );
  }
}
