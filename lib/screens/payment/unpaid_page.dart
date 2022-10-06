import 'package:madhvani_traders_app/app_properties.dart';
import 'package:madhvani_traders_app/screens/payment/promo_item.dart';
import 'package:flutter/material.dart';

class UnpaidPage extends StatefulWidget {
  @override
  _UnpaidPageState createState() => _UnpaidPageState();
}

class _UnpaidPageState extends State<UnpaidPage> {
  @override
  Widget build(BuildContext context) {
    Widget payNow = InkWell(
//      onTap: () => Navigator.of(context)
//          .push(MaterialPageRoute(builder: (_) => ViewProductPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: const Center(
          child: Text("Pay Now",
              style: TextStyle(
                  color: Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Material(
        color: Colors.white,
        child: SafeArea(
          child: LayoutBuilder(
              builder: (_, constraints) => SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: kToolbarHeight),
                          child: Column(children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Text(
                                    'Unpaid',
                                    style: TextStyle(
                                      color: darkGrey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CloseButton()
                                ],
                              ),
                            ),
                            PromoItem(),
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0, 16.0, 16.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadow,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  ListTile(
                                    title: Text('Laundry bar soap, sweets ..'),
                                    trailing: Text('256000'),
                                  ),
                                  ListTile(
                                    title: Text('Tax'),
                                    trailing: Text('1.25'),
                                  ),
                                  ListTile(
                                    title: Text('Subtotal'),
                                    trailing: Text('256000'),
                                  ),
                                  ListTile(
                                    title: Text('Promocode'),
                                    trailing: Text('-10.93'),
                                  ),
                                  Divider(),
                                  ListTile(
                                    title: Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(
                                      'UGX 228019.198',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: payNow,
                            )
                          ]))))),
        ));
  }
}
