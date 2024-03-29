import 'package:flutter/material.dart';
import 'package:recipe_x/presentation/video/video_screen.dart';

import '../account/account_screen.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';
import '../resource/resource_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  NavigatorItem(
      "Explore", "assets/icons/explore_icon.svg", 1, ResourceScreen()),
  NavigatorItem("Cart", "assets/icons/cart_icon.svg", 2, VideoScreen()),
  NavigatorItem(
      "Favourite", "assets/icons/favourite_icon.svg", 3, FavouriteScreen()),
  NavigatorItem("Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
];
