import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 80,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage("assets/images/visa-logo.png"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aaditya App Dev",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "0274 7414 ***",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.shadow),
              )
            ],
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.chevron_forward,
                color: Theme.of(context).colorScheme.shadow,
              ))
        ],
      ),
    );
  }
}
