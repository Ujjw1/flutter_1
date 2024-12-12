import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_model.dart'; // Make sure this file is in the correct path

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Manage postList within the state class
  List<Autogenerated> postList = [];

  Future<List<Autogenerated>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      postList = data.map((post) => Autogenerated.fromJson(post)).toList();
      return postList;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API Example',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Failed to load data'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                  snapshot.data![index].title ?? 'No Title'),
                              subtitle:
                                  Text(snapshot.data![index].body ?? 'No Body'),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: Text('data not found'),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}