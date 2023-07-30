import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'quantity_widget.dart';

class ShoppingCartCardWidget extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;

  const ShoppingCartCardWidget(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(16)),
          // padding:
          //     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Image.asset(
            productImage,
            width: 90,
            height: 90,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                productName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.indianRupeeSign,
                    color: Colors.amber.shade800,
                    size: 16,
                  ),
                  Text(productPrice,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.amber.shade800))
                ],
              ),
              const QuantityWidget()
            ],
          ),
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ))
      ],
    );
  }
}
