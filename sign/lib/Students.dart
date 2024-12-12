// ignore: file_names
import 'package:flutter/material.dart';
import 'categories_1.dart';

// ignore: must_be_immutable
class Student extends StatelessWidget {
  Student({super.key});

  List<CategoryModel_1> categories_2 = [];

  void _getInformation() {
    categories_2 = CategoryModel_1.categories_1;
  }

  @override
  Widget build(context) {
    _getInformation();
    return Container(
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                itemCount: categories_2.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          105), // Changed the border radius to make it circular
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                itemCount: categories_2.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          105), // Changed the border radius to make it circular
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
