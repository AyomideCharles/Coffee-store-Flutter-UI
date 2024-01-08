import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../model/coffeemodel.dart';

class DetailsPage extends StatefulWidget {
  final Coffee coffeedetail;

  const DetailsPage({super.key, required this.coffeedetail});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.navigate_before)),
                ),
                Flexible(
                  flex: 8,
                  child: Image.asset(
                    widget.coffeedetail.image,
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                const Flexible(flex: 1, child: Icon(FeatherIcons.heart))
              ],
            )
          ],
        ),
      ),
    );
  }
}
