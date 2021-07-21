import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/country.dart';
import '../services/database.dart';
import '../util.dart';
import '../views/countries.dart';
import '../views/favorites.dart';

class AppController extends GetxController {
  final RxBool _loading = false.obs;
  final RxBool _searching = false.obs;
  final RxInt _currentPage = 0.obs;
  // Using get set method to standardize the flow
  set currentPage(int value) => _currentPage.value = value;
  int get currentPage => _currentPage.value;

  set searching(bool value) => _searching.value = value;
  bool get searching => _searching.value;

  set loading(bool value) => _loading.value = value;
  bool get loading => _loading.value;
  // These lists are observable.
  RxList<Country> countries = <Country>[].obs;
  RxList<Country> queryResult = <Country>[].obs;
  RxList<Country> favorites = <Country>[].obs;

  late TextEditingController searchFieldController;
  // The different pages of the app.
  List<Widget> pages = <Widget>[
    CountriesPage(),
    FavoritesPage(),
  ];

  @override
  void onInit() async {
    searchFieldController = TextEditingController();
    // On init we need to get the data, by fetching all countries
    await _getCountries();
    super.onInit();
  }

  Future<void> _getCountries() async {
    loading = true;
    countries.clear();
    try {
      countries.addAll(await DatabaseService.getAllCountries());
      loading = false;
    } catch (e) {
      //A Custom toast message defined in utils
      toastMessage(
          title: 'Failed',
          message: 'Could not fetch countries',
          type: ToastType.error);
      loading = false;
    }
  }

  Future<void> onRefresh() async {
    searching = false;
    searchFieldController.clear();
    queryResult.clear();
    await _getCountries();
    toastMessage(
        title: 'Success',
        message: 'Fetched all countries',
        type: ToastType.success);
  }

  void queryResults({required String query}) {
    queryResult.clear();
    if (query.trim().isNotEmpty) {
      searching = true;
      queryResult.addAll(
        countries.where(
          (Country country) => country.name.toLowerCase().contains(
                query.trim().toLowerCase(),
              ),
        ),
      );
    } else {
      searching = false;
    }
  }

  void toggleFavorite(Country country) {
    if (favorites.contains(country)) {
      favorites.remove(country);
      toastMessage(
          title: 'Success',
          message: 'Country was removed from your favorites',
          type: ToastType.success);
    } else {
      favorites.add(country);
      toastMessage(
          title: 'Success',
          message: 'Country was added to your favorites',
          type: ToastType.success);
    }
  }

  //Here is a method to highlight the query letters in the list.

  List<TextSpan> filteredTextFormat({
    required String title,
  }) {
    final String query = searchFieldController.text;
    final String string =
        title.toLowerCase().replaceAll(query.toLowerCase(), '*');

    final List<TextSpan> textBuilder = <TextSpan>[];
    bool first = true;
    string.split('').forEach((String element) {
      if (element == '*') {
        textBuilder.add(TextSpan(
            text: first ? query.capitalizeFirst : query,
            style: Theme.of(Get.context!)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black)));
      } else {
        textBuilder.add(TextSpan(
            text: first ? element.capitalizeFirst : element,
            style: Theme.of(Get.context!)
                .textTheme
                .headline4!
                .copyWith(color: Colors.grey)));
      }
      first = false;
    });
    return textBuilder;
  }
}
