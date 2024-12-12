// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'categories.dart';
import 'categories_1.dart';

// ignore: must_be_immutable
class Student_Detail extends StatelessWidget {
  Student_Detail({super.key});

  List<CategoryModel> categories = [];
  List<CategoryModel_1> categories_2 = [];

  void _getInformation() {
    categories = CategoryModel.categories;
    categories_2 = CategoryModel_1.categories_1;
  }

  @override
  Widget build(BuildContext context) {
    _getInformation();

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notice Board',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 210,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 210,
                    child: Container(
                      decoration: BoxDecoration(
                        color: categories[index].boxcolor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 90),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/im.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            categories[index].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Text(
                            '02 March',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Homework',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    itemCount: categories_2.length,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 25),
                    itemBuilder: (context, index_1) {
                      return Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color:
                              categories_2[index_1].boxcolor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [Text(categories_2[index_1].name_1)],
                        ),
                      );
                    },
                  ),
                ),
                // ignore: avoid_unnecessary_containers
              ],
            ),
            // ignore: avoid_unnecessary_containers
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Text('Rama'),
        actions: [
          GestureDetector(
            child: Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
