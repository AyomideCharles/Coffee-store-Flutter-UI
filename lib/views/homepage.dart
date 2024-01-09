import 'package:coffee_store_ui/views/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../model/coffeemodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCoffeeType = 'Cappuccino';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 40),
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF131313), Color(0xE0313131)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: const ListTile(
                      title: Text(
                        'Location',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Iconsax.arrow_down5,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://wallpapercave.com/wp/wp4531250.jpg'),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (String coffeeType in [
                                'Cappuccino',
                                'Machiato',
                                'Latte',
                                'Americano',
                                'Espresso',
                              ])
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor:
                                          selectedCoffeeType == coffeeType
                                              ? const Color(0xFFC67C4E)
                                              : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedCoffeeType = coffeeType;
                                      });
                                    },
                                    child: Text(
                                      coffeeType,
                                      style: TextStyle(
                                        color: selectedCoffeeType == coffeeType
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 280,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            final selectedCoffee = coffee[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      coffeedetail: selectedCoffee,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Hero(
                                        tag: 'animate-${coffee[index].image}',
                                        child: Image.asset(
                                          coffee[index].image,
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            coffee[index].type,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            coffee[index].topping,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$ ${coffee[index].price.toString()}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xFFC67C4E),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 140,
                right: 15,
                left: 15,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search Coffee',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xFFC67C4E),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.sort))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
