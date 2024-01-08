import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.black, Colors.white],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      //   toolbarHeight: 100,
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cappuccino'),
                        Text('Machiato'),
                        Text('Latte'),
                        Text('Animation'),
                        Text('Flutter')
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const Card(
                            color: Colors.red,
                            child: Text('Hello'),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Search Coffee',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.sort)),
            ),
          ),
        ],
      ),
    );
  }
}
