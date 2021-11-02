import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:onono_rice/home.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/onboard1.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }
  

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 20.0, color: Color(0xFF0A0909));

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Color(0xFF6E6E6E)),
      titlePadding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      pageColor: Colors.white,
      bodyFlex: 2,
      imageFlex: 3,
      bodyAlignment: Alignment.bottomCenter,
      imageAlignment: Alignment.topCenter,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('ononoLogo.png', 120),
          ),
        ),
      ),
    
      
      pages: [
        PageViewModel(
          title: "Step 1 of 3",
          body:
              "Select the quantity you want to buy.",
          image: _buildImage('onboard1.png'),
          decoration: pageDecoration,
          reverse: true,
        ),
        PageViewModel(
          title: "Step 2 of 3",
          body:
              "Complete payment for your rice.",
          image: _buildImage('onboard2.png'),
          decoration: pageDecoration,
          reverse: true,
        ),
        PageViewModel(
          title: "Step 3 of 3",
          body:
              "Pick your rice from vendor during contact period.",
          image: _buildImage('onboard3.png'),
          decoration: pageDecoration,
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      showNextButton: true,
      skipFlex: 0,
      nextFlex: 0,
      dotsFlex: 2,
      skip: Container(
        child: const Center(
          child: Text(
          "Skip now",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 15.5,
            ),
          ),
        ),
      ),
      next: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Color(0xFF017C15),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Color(0xFF87FF8F),
            width: 8.0,
          ),
        ),
        child: const Center(
          child: Icon(
          Icons.navigate_next,
          size: 30,
          color: Color(0xFFE9E9E9),
          ),
        ),
      ),
      done: Container(
        height: 45,
        width: 110,
        decoration: BoxDecoration(
          color: Color(0xFF006411),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 40,
              offset: Offset(4.0, 4.0),
            )
          ]
        ),
        child: const Center(
          child: Text(
          "Get Started",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15.0,
            ),
          ),
        ),
      ),
      animationDuration: 1000,
      curve: Curves.fastOutSlowIn,
      controlsMargin: const EdgeInsets.all(10),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      dotsDecorator: const DotsDecorator(
        spacing: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 120.0),
        size: Size(10.0, 10.0),
        color: Color(0xAF9C9C9C),
        activeColor: Color(0xFF006411),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

void goHomepage(context){
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context){
      return HomePage();
    }),
    (Route<dynamic> route) => false);
}