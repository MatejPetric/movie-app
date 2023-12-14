import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackbarHelper {
  static void showMySnackbar(BuildContext context, String message,
      {int duration = 3000}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackbar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(fontSize: 13.sp),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.fixed,
      duration: Duration(milliseconds: duration),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
