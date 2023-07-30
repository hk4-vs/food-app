import 'package:flutter/material.dart';

class PromotionCardWidget extends StatelessWidget {
  final String image;
  final String firstLine;
  final String secundLine;
  final String thirdLine;
  final List<Color> gredintColor;

  const PromotionCardWidget(
      {super.key,
      required this.image,
      required this.firstLine,
      required this.secundLine,
      required this.thirdLine,
      required this.gredintColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: gredintColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstLine,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                secundLine,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                thirdLine,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.red,
                image: DecorationImage(image: AssetImage(image))),
          )
        ],
      ),
    );
  }
}
