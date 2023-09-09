import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosExample extends StatefulWidget {
  const PhotosExample({super.key});

  @override
  State<PhotosExample> createState() => _PhotosExampleState();
}

class _PhotosExampleState extends State<PhotosExample> {

  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photos);
      }
      return photosList;
    }else{
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('This is app bar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot){

              return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                  ),
                    subtitle: Text("title : " + snapshot.data![index].title.toString()),
                    title: Text("id : " + snapshot.data![index].id.toString()),
                );
              });
            }),
          )
        ],
      ),
    );
  }
}

class Photos{
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}