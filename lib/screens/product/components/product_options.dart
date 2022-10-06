import 'package:madhvani_traders_app/app_properties.dart';
import 'package:madhvani_traders_app/models/product.dart';
import 'package:madhvani_traders_app/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';

import 'shop_bottomSheet.dart';

class ProductOption extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Product product;
  const ProductOption(
    this.scaffoldKey, {
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16.0,
            child: Image.asset(
              product.image,
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            right: 0.0,
            child: SizedBox(
              height: 180,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(product.name,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadow)),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CheckOutPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 202, 141, 137),
                          gradient: mainButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: const Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.showBottomSheet((context) {
                        return ShopBottomSheet();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 212, 180, 178),
                          gradient: mainButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: const Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
