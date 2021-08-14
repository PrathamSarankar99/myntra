import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/services/constants.dart';
import 'package:myntra/widgets/category.dart';

appBarCallback(IconType iconType) {
  switch (iconType) {
    case IconType.search:
      print("Tap recognized : search");
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

List<Widget> getCallToActions({List<int> indexes = const []}) {
  return homePageAppBarIcons.map((e) {
    if (indexes.contains(homePageAppBarIcons.indexOf(e)) || indexes.isEmpty) {
      return IconButton(
        onPressed: () {
          appBarCallback(e.type);
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
