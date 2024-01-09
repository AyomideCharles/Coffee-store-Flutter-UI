import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../model/coffeemodel.dart';

class DetailsPage extends StatefulWidget {
  final Coffee coffeedetail;

  const DetailsPage({super.key, required this.coffeedetail});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedSize = 0;

  List size = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
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
                    child: ClipOval(
                      child: Hero(
                        tag: 'animate-${widget.coffeedetail.image}',
                        child: Image.asset(
                          widget.coffeedetail.image,
                          height: 350,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Flexible(flex: 1, child: Icon(Iconsax.heart))
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.coffeedetail.type,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(widget.coffeedetail.topping),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade900,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('4.5',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              const Divider(),
              const Text(
                'Description',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Enjoy the rich and aromatic experience of our signature Cappuccino. Indulge in the perfect blend of velvety espresso, steamed milk, and a luxurious layer of frothy foam. This exquisite beverage is a harmonious symphony of bold flavors and smooth textures..'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Size',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(110, 50),
                            backgroundColor: selectedSize == index
                                ? Colors.orange.shade200
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                color: selectedSize == index
                                    ? Colors.orange
                                    : Colors.grey)),
                        onPressed: () {
                          setState(() {
                            selectedSize = index;
                          });
                        },
                        child: Text(
                          size[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text('Price'),
                subtitle: Text(
                  '\$ ${widget.coffeedetail.price.toString()}',
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
