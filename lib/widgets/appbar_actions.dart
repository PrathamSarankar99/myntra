// List<Widget> appBarActions(BuildContext context, List<IconType> types) {
//   return types
//       .map(
//   (e) => IconButton(
//     onPressed: () {
//       onTapAppBarAction(context, e);
//     },
//     icon: Image.asset(
//       appBarIcons[e] ?? '',
//       width: 20,
//     ),
//     tooltip: iconTypeToolTip[e],
//   ),
// )
//       .toList();
// }

// onTapAppBarAction(BuildContext context, IconType type) {
//   switch (type) {
//     case IconType.search:
//       Navigator.push(context, PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return SearchPage();
//         },
//       ));
//       break;
//     case IconType.notification:
//       // TODO: Handle this case.
//       break;
//     case IconType.favourite:
//       // TODO: Handle this case.
//       break;
//     case IconType.cart:
//       // TODO: Handle this case.
//       break;
//   }
// }

import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/services/constants.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({Key? key, required this.type, required this.onTap})
      : super(key: key);
  final IconType type;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(
        appBarIcons[type] ?? '',
        width: 20,
      ),
      tooltip: iconTypeToolTip[type],
    );
  }
}
