import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarItems {
  static const listOfBottomBarItems = [
    //First Item
    BottomBarItem(
      inActiveItem: Icon(
        Icons.document_scanner_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.document_scanner,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Overview',
    ),
    //Second Item
    BottomBarItem(
      inActiveItem: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.shopping_cart,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Groceries',
    ),
    //ThirdItem
    BottomBarItem(
      inActiveItem: Icon(
        Icons.cloud_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.cloud,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Weather',
    ),
    //Fourth Item
    BottomBarItem(
      inActiveItem: Icon(
        Icons.edit_document,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.edit_document,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Bills',
    ),
    //Fifth Item
    BottomBarItem(
      inActiveItem: Icon(
        Icons.person_2_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.person_2_outlined,
        color: Colors.blueAccent,
      ),
      itemLabel: 'Profile',
    ),
  ];
}
