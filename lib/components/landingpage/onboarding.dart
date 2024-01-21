import 'package:flutter/material.dart';
import 'package:laundry_mama_rework/components/landingpage/aboutslider.dart';
import 'package:laundry_mama_rework/screen/authentication_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnBoarding();
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late Size size;
  late double height, width;
  int currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    AnimatedContainer getIndicator(int pageNo) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 10,
          width: (currentPage == pageNo) ? 20 : 10,
          /* no vertical margin only in left and right side */
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: (currentPage == pageNo) ? Colors.green : Colors.grey));
    }

    setCurrentPage(int value) {
      currentPage = value;
      setState(() {});
    }

    void changePage() {
      if (currentPage == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AuthenticationPage()));
      } else {
        _pageController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut);
      }
    }

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(230, 31, 134, 85),
      //   title: const Text('WELCOME'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.login_rounded),
      //       tooltip: 'Go to Login Page',
      //       onPressed: () {
      //         // Navigator.push(context,
      //         //     MaterialPageRoute(builder: (context) => LoginPage()));
      //       },
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'asset/images/bg.png',
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/images/bg.png'))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        AboutUsLnadingSlider(
                            context: context,
                            img: "onBoard1",
                            title: "Choose Clothes"),
                        AboutUsLnadingSlider(
                            context: context,
                            img: "onBoard2",
                            title: "Schedule Pickup"),
                        AboutUsLnadingSlider(
                            context: context,
                            img: "onBoard3",
                            title: "Get Best Iron Service"),
                        AboutUsLnadingSlider(
                          context: context,
                          img: "onBoard4",
                          title: "Pay Later",
                        ),
                      ],
                      onPageChanged: (value) => {setCurrentPage(value)},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => getIndicator(index),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 60),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xe61f8655),
                      Color.fromARGB(230, 31, 134, 85)
                    ],
                    stops: [0.2, 0.8],
                    begin: Alignment.topCenter,
                    end: Alignment.topLeft,
                  ),
                ),
                child: IconButton(
                  style: IconButton.styleFrom(),
                  splashRadius: 2,
                  onPressed: changePage,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
