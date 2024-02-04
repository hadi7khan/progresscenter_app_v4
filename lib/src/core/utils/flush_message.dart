import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'helper.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastSuccessMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Helper.successColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
    // Fluttertoast.showToast(
    //   toastLength: Toast.LENGTH_LONG,
    //   msg: message,
    //   backgroundColor: Helper.successColor,
    //   textColor: Colors.white,
    //   fontSize: 15.0,
    // );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Helper.errorColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
    // showFlushbar(
    //     context: context,
    //     flushbar: Flushbar(
    //       forwardAnimationCurve: Curves.decelerate,
    //       margin: const EdgeInsets.symmetric(
    //         horizontal: 20.0,
    //         vertical: 10.0,
    //       ),
    //       padding: const EdgeInsets.all(
    //         10.0,
    //       ),
    //       message: message,
    //       duration: const Duration(
    //         seconds: 3,
    //       ),
    //       borderRadius: BorderRadius.circular(
    //         8.0,
    //       ),
    //       flushbarPosition: FlushbarPosition.TOP,
    //       backgroundColor: Helper.errorColor,
    //       reverseAnimationCurve: Curves.easeInOut,
    //       positionOffset: 20.0,
    //       icon: const Icon(
    //         Icons.error,
    //         size: 28.0,
    //         color: Colors.white,
    //       ),
    //     )..show(context));
  }
}
