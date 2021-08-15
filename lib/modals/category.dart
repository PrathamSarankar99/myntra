import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final String title;
  final List<String> subCategories;
  final String imageURL;
  final Color backgroundColor;
  Category({
    required this.title,
    this.subCategories = const [],
    this.imageURL = '',
    this.backgroundColor = Colors.transparent,
  });
}
