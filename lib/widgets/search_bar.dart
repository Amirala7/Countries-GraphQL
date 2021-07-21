import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:remytest/controllers/app_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[100],
      floating: true,
      leading: Icon(
        CupertinoIcons.search,
        color: Colors.black,
      ),
      title: Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 6.0),
        child: GetBuilder<AppController>(
          builder: (AppController controller) => TextField(
            style: TextStyle(height: 0.8),
            controller: controller.searchFieldController,
            onChanged: (String query) => controller.queryResults(query: query),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0)),
                labelText: 'Filter',
                labelStyle: Theme.of(context).textTheme.caption,
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        ),
      ),
    );
  }
}
