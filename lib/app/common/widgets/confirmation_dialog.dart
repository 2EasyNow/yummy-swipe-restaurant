// Confirmation Dialog

import 'package:flutter/material.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';

// Confirmation Dialog Widget
// which takes onConfirm and onCancel callbacks
// and a title and a message
// takes a bool to show or hide the cancel button
// and a bool to show or hide the confirm button
// and String for confirm and cancel button text
//
// Usage:
// ConfirmationDialog(
//   title: "Delete",
//   message: "Are you sure you want to delete this item?",
//   onConfirm: () {
//     // do something
//   },
//   onCancel: () {
//     // do something
//   },
//   showCancelButton: true,
//   showConfirmButton: true,
//   confirmButtonText: "Yes",
//   cancelButtonText: "No",
// )
//
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;
  final Function onCancel;
  final bool showCancelButton;
  final bool showConfirmButton;
  final String confirmButtonText;
  final String cancelButtonText;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    this.showCancelButton = true,
    this.showConfirmButton = true,
    this.confirmButtonText = "Confirm",
    this.cancelButtonText = "Cancel",
    this.confirmButtonColor,
    this.cancelButtonColor,
  }) : super(key: key);

  // show Method
  show(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                minimumSize: const Size(0, 0),
              ),
            ),
          ),
          child: this,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors(context).backgroundVariant,
      title: Text(title),
      content: Text(message),
      actions: [
        if (showCancelButton)
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: cancelButtonColor ?? Theme.of(context).errorColor,
            ),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop();
            },
            child: Text(cancelButtonText),
          ),
        if (showConfirmButton)
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: confirmButtonColor ?? Theme.of(context).primaryColor,
            ),
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: Text(confirmButtonText),
          ),
      ],
    );
  }
}
