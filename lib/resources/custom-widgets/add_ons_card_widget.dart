import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnsCardWidget extends StatelessWidget {
  const AddOnsCardWidget({super.key, required this.assetImage});
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(
                assetImage,
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: Icon(
            CupertinoIcons.plus_circle_fill,
            color: Color(0xff0E803C),
          ),
        )
      ],
    );
  }
}
