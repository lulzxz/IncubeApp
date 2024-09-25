import 'package:flutter/material.dart';
import 'package:incube/component/Models.dart';
import 'package:incube/pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late PageController pageController;
  final String iconPath = "assets/icons/arrow-right.svg";
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            color: const Color(0xFFFFB800).withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: isLastPage
                ? getStarted()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () =>
                            pageController.jumpToPage(listOfItems.length - 1),
                        child: const Text('Skip'),
                      ),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: listOfItems.length,
                        onDotClicked: (currentIndex) =>
                            pageController.animateToPage(currentIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn),
                        effect: const WormEffect(
                          activeDotColor: Color(0xFFFFB800),
                          dotHeight: 12,
                          dotWidth: 12,
                        ),
                      ),
                      TextButton(
                          onPressed: () => pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn),
                          child: const Text("Next"))
                    ],
                  ),
          ),
          backgroundColor: const Color(0xFFFFB800).withOpacity(0.8),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                      onPageChanged: (pageController) => setState(() =>
                          isLastPage =
                              listOfItems.length - 1 == pageController),
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listOfItems.length,
                      itemBuilder: (ctx, index) {
                        return SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                                width: size.width,
                                height: size.height / 2.5,
                                child: Image.asset(listOfItems[index].img),
                              ),
                              Text(listOfItems[index].title),
                              Text(listOfItems[index].subTitle)
                            ],
                          ),
                        );
                      })),
            ]),
          )),
    );
  }

  Widget getStarted() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xFF3894FF),
      ),
      child: TextButton(
        child: const Text('Get Started'),
        onPressed: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool("Onboarding", true);

          if (!mounted) return;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
    );
  }
}
