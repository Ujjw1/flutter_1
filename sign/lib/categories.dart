// ignore: file_names
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconpath;
  Color boxcolor;

  CategoryModel({
    required this.name,
    required this.iconpath,
    required this.boxcolor,
  });

  static List<CategoryModel> get categories {
    // ignore: unused_local_variable
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'School is going for'
            'vacation in next month',
        iconpath: 'assets/plat.svg',
        boxcolor: const Color(0xff92A3fd)));
    categories.add(CategoryModel(
        name: 'Summer Book'
            'Fair at School Campus in June Scho'
            'for va',
        iconpath: 'assets/pancakes.svg',
        boxcolor: const Color(0xff92A3fd)));
    categories.add(CategoryModel(
        name: 'orange',
        iconpath: 'assets/orange.svg',
        boxcolor: const Color(0xff92A3fd)));
    categories.add(CategoryModel(
        name: 'School is going for'
            'vacation in next month',
        iconpath: 'assets/plat.svg',
        boxcolor: const Color(0xff92A3fd)));
    categories.add(CategoryModel(
        name: 'Summer Book'
            'Fair at School Campus in June Scho'
            'for va',
        iconpath: 'assets/pancakes.svg',
        boxcolor: const Color(0xff92A3fd)));
    categories.add(CategoryModel(
        name: 'orange',
        iconpath: 'assets/orange.svg',
        boxcolor: const Color(0xff92A3fd)));
    return categories;
  }
}
