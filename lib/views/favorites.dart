import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../models/country.dart';
import '../views/country_view.dart';
import '../widgets/country_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (AppController controller) => Obx(
        () => CustomScrollView(
          // To close the keyboard on user scroll
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: <Widget>[
            if (controller.favorites.isEmpty)
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('You have no favorite country!'),
                  ),
                ),
              ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                final Country country = controller.favorites[index];
                return Hero(
                  tag: country.name,
                  child: GestureDetector(
                      onTap: () {
                        Get.to(CountryView(country: country),
                            transition: Transition.downToUp);
                      },
                      child: CountryCard(country: country)),
                );
              }, childCount: controller.favorites.length),
            ),
          ],
        ),
      ),
    );
  }
}
