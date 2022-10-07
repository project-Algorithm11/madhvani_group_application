import 'package:madhvani_traders_app/app_properties.dart';
import 'package:madhvani_traders_app/models/product.dart';
import 'package:madhvani_traders_app/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  List<Product> products = [
    Product('assets/sugar.png', 'Sugar', 'Sugar for you everyday need', 5000),
    Product(
        'assets/soap.png', 'soap', 'Best soap for all your home needs', 8000),
    Product('assets/barbedwire.png', 'Barbed wire',
        'Tested for long time endurance', 200000),
    Product('assets/corrugatecarton.png', 'Corrugated cartons',
        'Best for your packaging needs', 350),
    Product(
        'assets/crowncorks.png',
        'crown corks',
        'Crown corks of any type and size\nThe crown cork was the first highly successful disposable product (it can be resealed, but not easily). This inspired King C. Gillette to invent the disposable razor when he was a salesman for the Crown Cork Company. The firm still survives, producing many forms of packaging.',
        25),
    Product('assets/steelrolling.jpeg', 'Steel rolling',
        'Strength was the priority in the process of making this roll', 250000),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              const Center(
                  child: Text(
                'Trending',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: StaggeredGridView.countBuilder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: const Alignment(0, 0),
                            radius: 0.6,
                            focal: const Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
