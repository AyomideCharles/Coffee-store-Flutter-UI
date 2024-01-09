import 'package:coffee_store_ui/bottomnv.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<PageData> data = pageList;
  PageController pages = PageController();
  int currentIndex = 0;

  void goToNextPage() {
    if (currentIndex < pageList.length - 1) {
      pages.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                PageData curIndex = pageList[index];
                return Image.asset(
                  curIndex.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                );
              },
              itemCount: pageList.length,
              controller: pages,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(color: Colors.brown.shade800),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                Text(
                  pageList[currentIndex].text,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  pageList[currentIndex].subtext,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      pageList.length,
                      (index) => AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: index == currentIndex ? 40 : 10,
                          duration: const Duration(milliseconds: 300))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {
                        goToNextPage();
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PageData {
  final String image;
  final String text;
  final String subtext;

  PageData({
    required this.image,
    required this.text,
    required this.subtext,
  });
}

List<PageData> pageList = [
  PageData(
      image: 'assets/coffeeCup.png',
      text: 'Time for a coffee break ....',
      subtext:
          'Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!'),
  PageData(
      image: 'assets/coffeeCup.png',
      text: 'Fast Delivery',
      subtext:
          'Savor the delightful notes of freshly brewed coffee, complemented by a touch of decadent chocolate. '),
  PageData(
      image: 'assets/coffeeCup.png',
      text: 'Reward Surprises',
      subtext:
          'Savings on meals and free delivery fees from great local and national resturants, updated for you each week.')
];
