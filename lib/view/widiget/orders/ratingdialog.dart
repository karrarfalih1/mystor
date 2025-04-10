import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store313/controller/orders/archiveorder_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
// show the dialog
      ratingDialog(context, orderid) {
      showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
      starSize: 30,
      initialRating: 1.0,
      // your app's name?
      title: const Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      ),
      ),
// encourage your user to leave a high rating?
            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(AppImagesasset.Logo),
            submitButtonText: 'Submit',
            submitButtonTextStyle: const TextStyle(
            color: AppColor.maincolor, fontWeight: FontWeight.bold),
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
            ArchiveorderController controller = Get.find();
            print(
            'rati------------------------------------------ng: ${response.rating}, comment: ${response.comment}');
            controller.snedrating(orderid, response.rating, response.comment);
            },
          ));
}
