import 'package:myntra/modals/IconType.dart';

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
