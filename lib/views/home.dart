import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      builder: (AppController controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentPage,
              onTap: (int index) => controller.currentPage = index,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
              ]),
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text(
              'Countries App',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: controller.pages[controller.currentPage],
        );
      },
    );
  }
}
