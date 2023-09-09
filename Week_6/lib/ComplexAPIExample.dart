import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/ProductsModel.dart';

class ComplexAPIExample extends StatefulWidget {
  const ComplexAPIExample({super.key});

  @override
  State<ComplexAPIExample> createState() => _ComplexAPIExampleState();
}

class _ComplexAPIExampleState extends State<ComplexAPIExample> {

  Future<ProductsModel> getProductsAPI() async {
    final response = await http.get(Uri.parse('https://webhook.site/041a7686-1ca0-4e5c-a1d0-35174c9b773c'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      return ProductsModel.fromJson(data);
    }else{
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex JSON Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getProductsAPI(),
                builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.height * 1,
                              child: ListView.builder(
                                itemCount: snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position){
                                  return Container(
                                    height: MediaQuery.of(context).size.height * .25,
                                    width: MediaQuery.of(context).size.height * .5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
                                      )
                                    ),
                                  );
                        }

                        ),
                              ),
                          ],
                        );
                      });
                }else{
                  return Text('Loading');
                }
                }),
          )
        ],
      ),
    );
  }
}
