import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './login.dart';
import 'package:termomete/widget/Custom_text.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required String topImgPath,
    required String title,
    required String subtitle,
    required String botImagePath,
  }) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: h * 0.4,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            ),
            image: DecorationImage(
              image: AssetImage(topImgPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.3,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: CustomText(
                  text: title,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(11, 55, 120, 1),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: w * 0.05),
            Image(
              image: AssetImage(botImagePath),
              width: w * 0.3,
            )
          ],
        ),
        SizedBox(height: w * 0.07),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 3);
            },
            children: [
              buildPage(
                topImgPath: 'img/intro_checktemp.jpg',
                botImagePath: "img/checktemp.png",
                title: 'Check temperature ',
                subtitle:
                    '"You can check the temperature in the particular freezer"',
              ),
              buildPage(
                  topImgPath: "img/intro_receivealert.jpg",
                  botImagePath: "img/alert1.png",
                  title: 'Receive notifications about freezers ',
                  subtitle:
                      "You can receive the alerts when temperature is low or high to particular limit "),
              buildPage(
                topImgPath: "img/intro_search.jpg",
                botImagePath: "img/search.png",
                title: 'Search all',
                subtitle:
                    "You can see temperature state in all freezers from one page ",
              ),
              buildPage(
                topImgPath: "img/intro_settemp.jpg",
                botImagePath: "img/settemp.png",
                title: 'Set a new freezer Temperature range ',
                subtitle:
                    "You can set the appropriate temperature range for the new freezer ",
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(11, 55, 120, 1),
                  minimumSize: const Size.fromHeight(80),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  // navigate directly to home page
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text('SKIP'),
                      onPressed: () => controller.jumpToPage(3),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Color.fromRGBO(11, 55, 120, 1),
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text('NEXT'),
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ],
                ),
              ),
      );
}
