import 'package:flutter/material.dart';
import 'package:datajson/Models/cocktailApi.dart';
import 'package:datajson/Models/constant.dart';
import 'package:datajson/Models/photoList.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  State<favoritePage> createState() => _favoritePageState();
}

List<Drinks> liked = [];

class _favoritePageState extends State<favoritePage> {
  get primary => null;

  @override
  void initState() {
    liked = liked.toSet().toList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: first,
        body: ListView.builder(
            itemCount: liked.length,
            itemBuilder: (context, index) {
              return bigPhotoCard(cocktail: liked[index]);
            }));
  }
}