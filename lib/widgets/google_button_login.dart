// import 'package:flutter/material.dart';
// import 'package:preacher/methods/auth_methods.dart';

// import '../constants/text_styles.dart';

// class GoogleLoginButton extends StatelessWidget {
//   const GoogleLoginButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade500),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(10),
//         ),
//       ),
//       child: ListTile(
//         leading: Image.asset(
//           "images/google.png",
//           scale: 100,
//         ),
//         title: Text(
//           "Continue with Google",
//           style: kTextStyleSize8.copyWith(fontWeight: FontWeight.w700),
//         ),
//         onTap: () {
//           AuthMethods().signInWithGoogle(context);
//         },
//       ),
//     );
//   }
// }
