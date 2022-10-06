import 'package:madhvani_traders_app/models/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
import 'recommended_list.dart';

// ignore: must_be_immutable
class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Sugar',
      'assets/sugar.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'Sweets',
      'assets/sweets.png',
    ),
    Category(
      const Color(0xff00E9DA),
      const Color(0xff5189EA),
      'Crowns corks',
      'assets/crowncorks.png',
    ),
    Category(
      const Color.fromARGB(255, 245, 237, 240),
      const Color.fromARGB(255, 216, 213, 218),
      'Steel',
      'assets/steelrolling.png',
    ),
    Category(
      const Color(0xff36E892),
      const Color(0xff33B2B9),
      'Tea',
      'assets/tea.png',
    ),
    Category(
      const Color(0xffF123C4),
      const Color(0xff668CEA),
      'Soap',
      'assets/soap.png',
    ),
  ];

  final TabController tabController;

  TabView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                              category: categories[index],
                            ))),
                const SizedBox(
                  height: 16.0,
                ),
                Flexible(child: RecommendedList()),
              ],
            ),
          ),
          Column(children: <Widget>[
            const SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            const SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            const SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
          Column(children: <Widget>[
            const SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedList())
          ]),
        ]);
  }
}
