import 'package:myntra/modals/AppBarIcon.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/modals/category.dart';

final List<AppBarIcon> homePageAppBarIcons = [
  AppBarIcon('assets/search.png', IconType.search),
  AppBarIcon('assets/notification.png', IconType.notification),
  AppBarIcon('assets/heart.png', IconType.favourite),
  AppBarIcon('assets/bag.png', IconType.cart),
];

final List types = [
  'Hot Deals',
  'Men',
  'Women',
  'Kids',
  'Beauty',
  'Home',
  'Footwear',
  'Gadgets',
  'Jewellery',
  'Luxury',
];

final List<Category> categories = [
  Category('Autumn winter 2021', "New Season Collection", ''),
  Category('Women', 'Kurtas & Suits, Top & Tees', ''),
  Category('Men', 'T-shirts, Shirts, Jeans, Shoes', ''),
  Category('Kids', 'Brands, Clothing, Footwear', ''),
  Category('Beauty & Personal care', 'Makeup, Fragnances, Grooming', ''),
  Category('Home and Living', 'Bedsheets, Blankets, Towels', ''),
  Category('Gadgets', 'Head phones, Smart, Wearables', ''),
  Category('Plus size', 'Tops, T-shirts, Kurtas', ''),
  Category('Theme stores', 'Wedding, Party, Hankerchiefs', ''),
  Category('Myntra luxe', 'Ted Baker, Fred Perry, Tissots', ''),
  Category('Myntra mall', 'H&M, Nike, Smashbox, Max', ''),
  Category('Pet essentials', 'Clothing, Accessories & More', ''),
];
