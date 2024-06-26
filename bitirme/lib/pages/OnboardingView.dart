import 'package:bitirme/Constants/Constants.dart';
import 'package:bitirme/pages/QuestionsView.dart';
import 'package:bitirme/pages/first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        pageBackgroundColor: greenGradientEnd,
        headerBackgroundColor: greenGradientEnd,
        finishButtonText: 'Start to analysis!',
        skipTextButton: Text(""),
        trailing: Text(""),
        centerBackground: true,
        onFinish: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const QuestionsView()),
              (Route<dynamic> route) => false);
        },
        finishButtonStyle: FinishButtonStyle(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          backgroundColor: Color.fromRGBO(29, 172, 146, 1),
        ),
        background: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              'images/onboarding1.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              'images/onboarding2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              'images/onboarding3.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
        totalPage: 3,
        speed: 1,
        pageBodies: [
          OnboardingInfoWidget(
            title: "Welcome",
            subtitle:
                "Discover the key to a healthy life. Go ahead to get started!",
          ),
          OnboardingInfoWidget(
            title: "What is diabetes?",
            subtitle:
                "Diabetes is a condition in which blood sugar levels are constantly high.",
          ),
          OnboardingInfoWidget(
            title: "How it works?",
            subtitle:
                "Fill in the requested information and let us make a diabetes prediction for you.",
          ),
        ],
      ),
    );
  }
}

class OnboardingInfoWidget extends StatelessWidget {
  String title;
  String subtitle;

  OnboardingInfoWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
          ),
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
