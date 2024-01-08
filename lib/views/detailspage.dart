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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    flex: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        widget.coffeedetail.image,
                        height: 350,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Flexible(flex: 1, child: Icon(FeatherIcons.heart))
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.coffeedetail.type,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(widget.coffeedetail.topping),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FeatherIcons.star,
                      color: Colors.yellow.shade900,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('4.5',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              const Divider(),
              const Text(
                'Description',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Enjoy the rich and aromatic experience of our signature Cappuccino. Indulge in the perfect blend of velvety espresso, steamed milk, and a luxurious layer of frothy foam. This exquisite beverage is a harmonious symphony of bold flavors and smooth textures. '),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Size',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(110, 50),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(color: Colors.grey)),
                        onPressed: () {},
                        child: const Text(
                          'Hello',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )),
              const Spacer(),
              ListTile(
                title: const Text('Price'),
                subtitle: Text(
                  widget.coffeedetail.price.toString(),
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(230, 50)),
                    onPressed: () {},
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
