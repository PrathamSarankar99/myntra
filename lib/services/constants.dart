import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/modals/category.dart';

final Map<IconType, String> appBarIcons = {
  IconType.search: 'assets/search.png',
  IconType.notification: 'assets/notification.png',
  IconType.favourite: 'assets/heart.png',
  IconType.cart: 'assets/bag.png',
};

Map<IconType, String> iconMap = {
  IconType.search: 'assets/search.png',
  IconType.notification: 'assets/notification.png',
  IconType.favourite: 'assets/heart.png',
  IconType.cart: 'assets/bag.png',
};

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
  Category(
      title: 'Autumn winter 2021',
      subCategories: ["New Season Collection"],
      backgroundColor: Color(0xffe4f0df),
      imageURL: ''),
  Category(
      title: 'Women',
      subCategories: ['Kurtas & Suits', 'Top & Tees'],
      backgroundColor: Color(0xffefdbd3),
      imageURL: ''),
  Category(
      title: 'Men',
      subCategories: ['T-shirts', 'Shirts', 'Jeans', 'Shoes'],
      backgroundColor: Color(0xfff9ebd1),
      imageURL: ''),
  Category(
      title: 'Kids',
      subCategories: ['Brands', 'Clothing', 'Footwear'],
      backgroundColor: Color(0xfffddde6),
      imageURL: ''),
  Category(
      title: 'Beauty & Personal care',
      backgroundColor: Color(0xfff6f4f6),
      subCategories: ['Makeup', 'Fragnances', 'Grooming'],
      imageURL: ''),
  Category(
      title: 'Home and Living',
      subCategories: ['Bedsheets', 'Blankets', 'Towels'],
      backgroundColor: Color(0xfff0f0f1),
      imageURL: ''),
  Category(
      title: 'Gadgets',
      subCategories: ['Head phones', 'Smart', 'Wearables'],
      backgroundColor: Color(0xfffbdcc1),
      imageURL: ''),
  Category(
      title: 'Plus size',
      subCategories: ['Tops', 'T-shirts', 'Kurtas'],
      backgroundColor: Color(0xfffbf1d1),
      imageURL: ''),
  Category(
      title: 'Theme stores',
      subCategories: ['Wedding', 'Party', 'Hankerchiefs'],
      imageURL: ''),
  Category(
      title: 'Myntra luxe',
      subCategories: ['Ted Baker', 'Fred Perry', 'Tissots'],
      backgroundColor: Color(0xfffddbeb),
      imageURL: ''),
  Category(
      title: 'Myntra mall',
      subCategories: ['H&M', 'Nike', 'Smashbox', 'Max'],
      backgroundColor: Color(0xfff7e1da),
      imageURL: ''),
  Category(
      title: 'Pet essentials',
      subCategories: ['Clothing', 'Accessories'],
      backgroundColor: Color(0xffe8f1ee),
      imageURL: ''),
];
