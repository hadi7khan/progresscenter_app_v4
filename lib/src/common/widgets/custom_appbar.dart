// import 'package:flutter/material.dart';
// import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final String imgTitle;
//   final String adminName;
//   const CustomAppBar({
//     Key? key,
//     required this.title,
//     required this.imgTitle,
//     // required this.adminNsame,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery.of(context).size.width < 700
//         ? AppBar(
//             centerTitle: false,
//             title: Text(
//               title,
//               style: TextStyle(
//                 color: Helper.secondary,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           )
//         : PreferredSize(
//           preferredSize: Size(MediaQuery.of(context).size.width, 88),
          
//           child: AppBar(
//               centerTitle: false,
//               backgroundColor: Colors.white,
//               title: Text(
//                 title,
//                 style: TextStyle(
//                   color: Helper.secondary,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               // actions: [
//               //   Padding(
//               //     padding: EdgeInsets.only(
//               //       right: 20.w,
//               //     ),
//               //     child: Row(mainAxisSize: MainAxisSize.min, children: [
//               //       CircleAvatar(
//               //         radius: 16,
//               //         backgroundColor: Helper.primary,
//               //         child: Text(
//               //           imgTitle,
//               //           style: const TextStyle(
//               //             color: Colors.white,
//               //           ),
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         width: 8.w,
//               //       ),
//               //       Text(
//               //         adminName,
//               //         style: const TextStyle(
//               //           fontSize: 16,
//               //           fontWeight: FontWeight.w600,
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         width: 8.w,
//               //       ),
//               //       PopupMenuButton(
//               //         offset: const Offset(40, 35),
//               //         shadowColor: const Color.fromRGBO(144, 144, 144, 0.1),
//               //         padding: EdgeInsets.zero,
//               //         shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.all(
//               //             Radius.circular(
//               //               8.r,
//               //             ),
//               //           ),
//               //         ),
//               //         icon: const Icon(
//               //           Icons.keyboard_arrow_down,
//               //           color: Color.fromRGBO(188, 188, 194, 1),
//               //           size: 16,
//               //         ),
//               //         itemBuilder: (context) {
//               //           return [
//               //             PopupMenuItem(
//               //               // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h,),
//               //               value: 0,
//               //               child: SizedBox(
//               //                 width: 117,
//               //                 child: Row(
//               //                   mainAxisSize: MainAxisSize.min,
//               //                   children: [
//               //                     Image.asset('assets/images/person.png'),
//               //                     SizedBox(
//               //                       width: 5.75.w,
//               //                     ),
//               //                     Text(
//               //                       'Account',
//               //                       style: TextStyle(
//               //                         fontWeight: FontWeight.w500,
//               //                         fontSize: 14,
                                    
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             ),
//               //             PopupMenuItem(
//               //               //  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h,),
//               //               value: 1,
//               //               child: SizedBox(
//               //                 width: 117,
//               //                 child: Row(
//               //                   mainAxisSize: MainAxisSize.min,
//               //                   children: [
//               //                     Image.asset('assets/images/logout.png'),
//               //                     SizedBox(
//               //                       width: 5.75.w,
//               //                     ),
//               //                     Text(
//               //                       'Logout',
//               //                       style: TextStyle(
//               //                         fontWeight: FontWeight.w500,
//               //                         fontSize: 14,
//               //                         color: Colors.red,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             ),
//               //           ];
//               //         },
//               //         onSelected: (value) {
//               //           // if (value == 0) {
//               //           //   print("AccountScreen is selected");
//               //           //   context.push("/accounts");
//               //           // } else if (value == 1) {
//               //           //   helper.logout().then((value) {
//               //           //     context.pushReplacement('/login');
//               //           //     ScaffoldMessenger.of(context).showSnackBar(
//               //           //         const SnackBar(
//               //           //             backgroundColor: Colors.red,
//               //           //             content: Text("Logged Out")));
//               //           //     // Navigator.of(context).pushAndRemoveUntil(
//               //           //     //     MaterialPageRoute(builder: (context) => LoginScreen()),
//               //           //     //     (route) => false);
//               //           //   });
//               //           // }
//               //         },
//               //       )
//               //     ]),
//               //   ),
//               // ],
            
//             ),
//         );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }