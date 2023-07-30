import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCardWidget extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  const ProductCardWidget(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 140,
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.onSurface,
          ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: AssetImage(productImage))),
          ),
          Text(
            productName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                          .bodyLarge!
                          .copyWith(color: Colors.amber.shade800))
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Color(0xff0E803C),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
