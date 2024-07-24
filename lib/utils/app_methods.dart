import 'package:flutter/material.dart';
import '../components/custom_snakcbar.dart';
import '../data/dummy_data.dart';
import '../models/watch_model.dart';

class AppMethods {
  AppMethods._(); // Private constructor to prevent instantiation

  /// Adds an item to the cart and shows a snackbar indicating success or failure.
  static void addToCart(WatchModel data, BuildContext context) {
    final bool isItemInCart = itemsOnBag.contains(data);

    if (isItemInCart) {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackbars.failedSnackbar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackbars.successSnackbar());
    }
  }

  /// Calculates the total price of all items in the cart.
  static double getTotalPrice() {
    double totalPrice = 0.0;

    for (final WatchModel item in itemsOnBag) {
      totalPrice += item.price;
    }

    return totalPrice;
  }
}
