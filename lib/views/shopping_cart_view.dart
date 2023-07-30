import 'package:flutter/material.dart';

import '../resources/custom-widgets/payment_card_widget.dart';
import '../resources/custom-widgets/shopping_cart_card_widget.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key, this.itemCount = 2});
  final int? itemCount;

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.onBackground.withOpacity(0.85),
          ], begin: Alignment.topCenter, end: Alignment.bottomLeft)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.itemCount} Items in cart",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const ShoppingCartCardWidget(
                productImage: "assets/images/categories/dessert.png",
                productName: "Strawberry Cake",
                productPrice: "199",
              ),
              const ShoppingCartCardWidget(
                productImage: "assets/images/products/beef-burger.png",
                productName: "Beef Burger",
                productPrice: "99",
              ),
              Text(
                "Payment Method",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              const PaymentCardWidget(),
              const SizedBox(
                height: 20,
              ),
              const TotalAndSubtotalWidget(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () {
                      // pushNewScreen(
                      //   context,
                      //   screen: const ShoppingCartView(),
                      //   withNavBar: true, // OPTIONAL VALUE. True by default.
                      //   pageTransitionAnimation: PageTransitionAnimation.slideUp,
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 60.0),
                        backgroundColor: const Color(0xff462B9C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(
                      "Order",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).highlightColor,
                          letterSpacing: 3.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalAndSubtotalWidget extends StatelessWidget {
  const TotalAndSubtotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Subtotal",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.shadow),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color: Theme.of(context).colorScheme.shadow,
                    size: 18,
                  ),
                  Text("298",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.shadow,
                          ))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                "Tax 10%",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.shadow),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color: Theme.of(context).colorScheme.shadow,
                    size: 18,
                  ),
                  Text("29",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.shadow,
                          ))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Icon(
                    Icons.currency_rupee,
                    color: Colors.amber.shade800,
                    size: 20,
                  ),
                  Text("327",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.amber.shade800,
                          ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
