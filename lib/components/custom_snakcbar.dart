import 'package:flutter/material.dart';

class CustomSnackbars {
  CustomSnackbars._();

  static SnackBar successSnackbar() {
    return SnackBar(
      backgroundColor: Colors.green,
      content: const Text("Successfully added to your bag!"),
      action: SnackBarAction(
        textColor: Colors.white,
        label: "Got it",
        onPressed: () {},
      ),
    );
  }

  static SnackBar failedSnackbar() {
    return SnackBar(
      backgroundColor: Colors.red,
      content: const Text("You have added this item before"),
      action: SnackBarAction(
        textColor: Colors.white,
        label: "Got it",
        onPressed: () {},
      ),
    );
  }
}
