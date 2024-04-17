import 'package:api_fetching/model/fetch_model.dart';
import 'package:api_fetching/services/fetch_service.dart';
import 'package:flutter/material.dart';

class ApiFetchScreen extends StatelessWidget {
  const ApiFetchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Services api = Services();
    return Scaffold(
      body: FutureBuilder(
        future: api.getData(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center( 
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError){
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          else{
            List<ApiFetchModel>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index){
                ApiFetchModel datas = data[index];
                return ListTile(
                  title: Text(datas.title.toString()),
                );
              }
             );
          }
        },
      ),
    );
  }
}