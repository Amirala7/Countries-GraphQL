import 'package:flutter/material.dart';

import '../models/country.dart';
import '../widgets/country_card.dart';

class CountryView extends StatelessWidget {
  const CountryView({Key? key, required this.country}) : super(key: key);
  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          country.name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(children: <Widget>[
        Hero(tag: country.name, child: CountryCard(country: country))
      ]),
    );
  }
}
