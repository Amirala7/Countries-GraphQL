import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/app_controller.dart';
import '../models/country.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({Key? key, required this.country}) : super(key: key);
  final Country country;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 150,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<AppController>(
        builder: (AppController controller) => Row(
          children: <Widget>[
            _VerticalDivider(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Obx(
                    () => _Detail(
                      title: 'Country',
                      subtitle: controller.searching
                          ? TextSpan(children: <TextSpan>[
                              ...controller.filteredTextFormat(
                                  title: country.name),
                            ])
                          : TextSpan(
                              text: country.name,
                              style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                  _Detail(
                    title: 'Capital City',
                    subtitle: TextSpan(
                        text: country.capital,
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  _Detail(
                    title: 'Population',
                    subtitle: TextSpan(
                        text: country.population,
                        style: Theme.of(context).textTheme.headline5),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    controller.toggleFavorite(country);
                  },
                  child: Obx(() => Icon(controller.favorites.contains(country)
                      ? Icons.favorite
                      : Icons.favorite_outline)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 1,
      color: Colors.grey[700],
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final TextSpan subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        RichText(
          text: subtitle,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
