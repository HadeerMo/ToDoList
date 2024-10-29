import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/custom_btn.dart';
import 'package:to_do_app/views/widgets/custom_input.dart';

Future<dynamic> customDialog(
  BuildContext context,
  double hightOfScreen,
  double widthOfScreen, {
  required TextEditingController? controller,
  required void Function()? onPressed,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          child: SizedBox(
            height: hightOfScreen * .3,
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      right: 15,
                      left: 15,
                      bottom: 20,
                    ),
                    child: CustomInput(
                      controller: controller,
                    ),
                  ),
                  CustomBtn(
                    onPressed: onPressed,
                    widthOfScreen: widthOfScreen * .5,
                  )
                ],
              ),
            ),
          ),
        );
      });
}
