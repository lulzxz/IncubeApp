import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incube/component/Models.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late PageController pageController;
  final String iconPath = "assets/icons/arrow-right.svg";

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFFFB800).withOpacity(0.8),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                      controller: pageController,
                      physics: BouncingScrollPhysics(),
                      itemCount: listOfItems.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          width: size.width,
                          height: size.height,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 40, 15, 10),
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
              SizedBox(
                width: 32,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    pageController.nextPage(
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 300));
                  },
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: SvgPicture.asset(iconPath),
                ),
              ),
            ]),
          )),
    );
  }
}
