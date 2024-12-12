import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}
Future<List<Photos>> getPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  var data = jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    return data.map((i) => Photos.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Course'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].thumbnailUrl),
                              ),
                              title: Text('id: ${snapshot.data![index].id}'),
                              subtitle: Text(snapshot.data![index].title),
                            );
                          });
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  })),
        ],
      ),
    );
  }
}

class Photos {
  String title, url, thumbnailUrl;
  int id;

  Photos(
      {required this.title,
      required this.url,
      required this.id,
      required this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      thumbnailUrl: json['thumbnailUrl'],
      title: json['title'],
      url: json['url'],
      id: json['id'],
    );
  }
}
