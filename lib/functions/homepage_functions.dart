import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/screens/search_page.dart';
import 'package:myntra/services/constants.dart';
import 'package:myntra/widgets/category.dart';

appBarCallback(BuildContext context, IconType iconType) {
  NavigatorState state = Navigator.of(context);
  switch (iconType) {
    case IconType.search:
      state.push(PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return SearchPage();
        },
      ));
      break;
    case IconType.notification:
      print('Tap recognized : notificaition');
      break;
    case IconType.favourite:
      print('Tap recognized : favourite');
      break;
    case IconType.cart:
      print('Tap recognized : cart');
      break;
  }
}

List<Widget> getCallToActions(BuildContext context,
    {List<int> indexes = const []}) {
  return homePageAppBarIcons.map((e) {
    if (indexes.contains(homePageAppBarIcons.indexOf(e)) || indexes.isEmpty) {
      return IconButton(
        onPressed: () {
          appBarCallback(context, e.type);
        },
        icon: Image.asset(
          e.path,
          width: 20,
        ),
        tooltip: iconTypeToolTip[e.type],
      );
    }
    return Container();
  }).toList();
}

List<Widget> getTypes() {
  return types.map((e) => CategoryWidget(title: e)).toList();
}
