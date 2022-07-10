import 'package:ewipe/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                color: Colors.pink.shade100,
                urlImage: 'assets/images/reduce.png',
                title: 'Reduce',
                subtitle: 'The first R is all about creating less waste.'
                    '\n'
                    'Here are some of the ways you can do this:'
                    '\n'
                    ' * Choose products with less packaging'
                    '\n'
                    ' * Look for items that you can re-use'
                    '\n'
                    ' * Reducing the amount of waste we all generate is a great way to benefit the environment.'),
            buildPage(
                color: Colors.purple.shade100,
                urlImage: 'assets/images/reuse.png',
                title: 'Reuse',
                subtitle:
                    'The second R looks at how you can use certain items again before replacing them. '
                    '\n'
                    'A bonus of reusing?'
                    '\n'
                    'As well as helping the environment, you could save money too!'),
            buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/images/recycle.png',
                title: 'ReCycle',
                subtitle:
                    'The third R is about making sure you separate items that can be recycled, meaning they can be used for a new purpose.'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.pink.shade700,
                  minimumSize: const Size.fromHeight(80)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Get Started',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'إنطلق',
                    style: TextStyle(fontFamily: 'taj', fontSize: 24),
                  ),
                ],
              ),
              onPressed: () async {
                //_bottomSheet(context);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () => controller.jumpToPage(2)),
                  Center(
                    child: SmoothPageIndicator(
                      effect: WormEffect(activeDotColor: Colors.pink.shade300),
                      controller: controller,
                      count: 3,
                    ),
                  ),
                  TextButton(
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut)),
                ],
              ),
            ),
    );
  }
}

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) =>
    Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.pink.shade700,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
