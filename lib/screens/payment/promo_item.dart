import 'package:madhvani_traders_app/app_properties.dart';
import 'package:madhvani_traders_app/models/product.dart';
import 'package:madhvani_traders_app/screens/product/components/color_list.dart';
import 'package:madhvani_traders_app/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 280,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(0, 0.8),
            child: Container(
                height: 250,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(top: 12.0, right: 12.0),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Laundry bar soap',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: darkGrey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0, top: 8.0, bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const <Widget>[
                                      ColorOption(
                                          Color.fromARGB(255, 214, 178, 176)),
                                      Text(
                                        'UGX 1250.24',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: darkGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
//TODO: Work on scroll quantity
//                            CustomPaint(
//                              painter: Scroll(),
//                              child: Container(
//                                width: 70,
//                                height: 100,
//                                padding: EdgeInsets.only(top: 20),
//                                child: Center(
//                                  child: ListWheelScrollView.useDelegate(
////                                  magnification: 1.1,
////                                  squeeze: 1,
////                                  perspective: 0.01,
////                                  useMagnifier: true,
//                                    itemExtent: 40,
//                                    squeeze: 1.5,
//                                    onSelectedItemChanged: (i) {
//                                      print(i);
//                                    },
//                                    physics: BouncingScrollPhysics(),
//                                    childDelegate: ListWheelChildListDelegate(
//                                        children: [0, 1, 2, 3, 4, 5, 6, 7]
//                                            .map((i) => Text(
//                                                  '$i',
//                                                  style:
//                                                      TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
//                                                ))
//                                            .toList()),
//                                  ),
//                                ),
//                              ),
//                            )
                        ]),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 32.0, bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Use Promo Code'),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey[200],
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Promo Code'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 5,
            child: ShopProductDisplay(
              Product(
                  'assets/soap.png', 'Laundry bar soap', 'description', 8000),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
