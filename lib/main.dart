import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:datajson/Screen/search.dart';
import 'package:datajson/Models/profile.dart';
import 'package:datajson/Models/photoList.dart';
import 'package:datajson/Models/cocktailApi.dart';
import 'package:datajson/Models/constant.dart';
import 'package:datajson/Screen/favorite.dart';

void main() {
  runApp(const MyApp());
}

const List<Widget> _widgetOptions = <Widget>[
  mainPage(),
  favoritePage(),
  searchPage(),
  SettingsUI()
];

// ignore: prefer_typing_uninitialized_variables
late var futureCocktail;
int selectedIndex = 0;
List<String> types = ["Margarita", "Martini", "Mojito", "Sangria"];
var cocktail = "Margarita";
late String id;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    id = types[Random().nextInt(4)];
    futureCocktail = getCocktail();
    super.initState();
  }

  Cocktail parseCocktail(String response) {
    return Cocktail.fromJson(json.decode(response));
  }

  Future<Cocktail> getCocktail() async {
    var url = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$id");

    var cvp = await http.get(url);

    return parseCocktail(cvp.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan label DEBUG
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primary,
          title: Text(
            "Dr.Ink",
            style: title,
          ),
        ),
        backgroundColor: primary,
        body: _widgetOptions[selectedIndex],
        bottomNavigationBar: Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.star_border_outlined,
                    ),
                    label: 'Liked'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile'),
              ],
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              unselectedItemColor: const Color.fromARGB(255, 130, 47, 47),
              selectedItemColor: const Color.fromARGB(255, 16, 98, 164),
              showUnselectedLabels: false,
              backgroundColor: accent,
            ),
          )
        ]),
      ),
    );
  }
}

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cocktail>(
        future: futureCocktail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data!;
            var drinks = list.drinks;
            return SafeArea(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    return bigPhotoCard(
                      cocktail: drinks[index],
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}