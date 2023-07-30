import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/views/dashboard_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../resources/custom-widgets/add_ons_card_widget.dart';
import '../resources/custom-widgets/quantity_widget.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView(
      {super.key, required this.image, required this.price});
  final String image;
  final String price;

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  int quntity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff462B9C),
          Color(0xff644AB5),
        ], begin: Alignment.topCenter, end: Alignment.bottomLeft)),
        child: Column(
          children: [
            // Top Side of Screen
            Flexible(
                child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.left_chevron,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                  Center(
                      child: Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ))
                ],
              ),
            )),

            // Bottom Side of Screen
            Flexible(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(50.0))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    RatingAndRupeeWidget(
                      price: widget.price,
                    ),
                    productNameAndQuantity(context),
                    Text(
                      "Big juicy beef burger with cheese, lettuce, tomato, onions and special sauce !",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Add Ons",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AddOnsCardWidget(
                          assetImage: "assets/images/categories/dessert.png",
                        ),
                        AddOnsCardWidget(
                          assetImage: "assets/images/products/colddrink.png",
                        ),
                        AddOnsCardWidget(
                          assetImage: "assets/images/products/pasta.png",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          pushNewScreen(
                            context,
                            screen: const DashBoardView(
                              initialValue: 2,
                            ),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.slideUp,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.maxFinite, 60.0),
                            backgroundColor: const Color(0xff462B9C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Text(
                          "Add  to  Cart",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).highlightColor),
                        )),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Row productNameAndQuantity(BuildContext context) {
    return Row(
      children: [
        Text(
          "Beef Burger",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Expanded(child: Container()),
        const QuantityWidget()
      ],
    );
  }
}

class RatingAndRupeeWidget extends StatelessWidget {
  const RatingAndRupeeWidget({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
            icon: const Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
            ),
            label: Text(
              "4.5",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            )),
        Expanded(child: Container()),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.indianRupeeSign,
              color: Colors.amber.shade800,
              size: 16,
            ),
            Text(price,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.amber.shade800))
          ],
        ),
      ],
    );
  }
}
