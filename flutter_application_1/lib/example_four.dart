import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

var data;
Future<void> getapli() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    data = jsonDecode(response.body);
  } else {}
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getapli(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading');
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(children: [
                              ReusbaleRow(
                                  title: 'name',
                                  value: data[index]['name'].toString()),
                              ReusbaleRow(
                                  title: 'username',
                                  value: data[index]['username'].toString()),
                              ReusbaleRow(
                                title: 'address',
                                value:
                                    data[index]['address']['street'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'Lat',
                                value: data[index]['address']['geo']['lat']
                                    .toString(),
                              ),
                              ReusbaleRow(
                                title: 'Lat',
                                value: data[index]['address']['geo']['lng']
                                    .toString(),
                              ),
                            ]),
                          );
                        },
                      );
                    }
                  }))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
