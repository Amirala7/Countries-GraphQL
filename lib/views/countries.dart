import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../models/country.dart';
import '../views/country_view.dart';
import '../widgets/country_card.dart';
import '../widgets/search_bar.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (AppController controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.onRefresh();
        },
        // Here we listen to changes to AppController countries
        child: Obx(
          () => CustomScrollView(
            // To close the keyboard on user scroll
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: <Widget>[
              SearchBar(),
              // If the countries are loading we should a spinner
              if (controller.countries.isEmpty && controller.loading)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              // If the loading is done
              // but there are no results we show a message
              if (controller.countries.isEmpty && !controller.loading)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Text("We couldn't fetch the data!"),
                    ),
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final Country country = controller.searching
                      ? controller.queryResult[index]
                      : controller.countries[index];
                  return Hero(
                    tag: country.name,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(() => CountryView(country: country),
                              transition: Transition.downToUp);
                        },
                        child: CountryCard(country: country)),
                  );
                },
                    childCount: controller.searching
                        ? controller.queryResult.length
                        : controller.countries.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
