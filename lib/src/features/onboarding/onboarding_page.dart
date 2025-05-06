import 'package:flutter/material.dart';
import 'package:idelivery_app/main.dart';
import 'package:idelivery_app/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:idelivery_app/src/features/onboarding/onboarding_screen.dart';
import 'package:idelivery_app/src/features/onboarding/onboard_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: [
              // IntroScreen(color: Colors.blue.shade300,),
              // IntroScreen(color: Colors.green,),IntroScreen(color: Colors.deepPurple,)
              OnboardingScreen(
                  screenText: 'Get your packages delivered',
                  imagePath: imageLink1),
              OnboardingScreen(
                  screenText: 'Track your Orders easily',
                  imagePath: imageLink2),
              OnboardingScreen(
                  screenText: 'Speak with Customer service',
                  imagePath: imageLink3),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.85),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TextButton(onPressed: () {}, child: const Text('SKIP'), st),
                  GestureDetector(
                      onTap: () => _controller.jumpToPage(2),
                      child: onboardButton('SKIP')),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.white38,
                        activeDotColor: Colors.white),
                    onDotClicked: (index) => _controller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                  isLastPage
                      ? GestureDetector(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('showHome', true);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: onboardButton('DONE'))
                      : GestureDetector(
                          onTap: () => _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          child: onboardButton('NEXT')),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
