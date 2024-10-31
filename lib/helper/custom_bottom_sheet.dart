// import 'package:flutter/material.dart';
// import 'package:to_do_app/views/widgets/custom_btn.dart';
// import 'package:to_do_app/views/widgets/custom_input.dart';

// Future<dynamic> showCustomBottomSheet(
//   BuildContext context,
//   double hightOfScreen,
//   double widthOfScreen, {
//   void Function()? onPressed,
//   TextEditingController? controller,
// }) {
//   return showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return Container(
//         width: double.infinity,
//         color: Colors.amber[50],
//         child: Form(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical: 50, horizontal: widthOfScreen * .05),
//                 child: CustomInput(
//                   // controller: controller,
//                 ),
//               ),
//               CustomBtn(
//                 onPressed: onPressed,
//                 widthOfScreen: widthOfScreen,
//               )
//             ],
//           ),
//         ),
//       );
//     },
//     isScrollControlled: true,
//   );
// }
