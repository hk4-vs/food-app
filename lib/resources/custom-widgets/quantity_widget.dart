import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quntity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (quntity > 1) {
                  quntity = quntity - 1;
                }
              });
            },
            icon: Icon(
              CupertinoIcons.minus_circle,
              color: Theme.of(context).primaryColor,
            )),
        Text(
          "$quntity",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        IconButton(
            onPressed: () {
              setState(() {
                quntity = quntity + 1;
              });
            },
            icon: Icon(
              CupertinoIcons.plus_circle,
              color: Theme.of(context).primaryColor,
            ))
      ],
    );
  }
}
