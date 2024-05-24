import 'package:bitirme/Constants/Constants.dart';
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
        finishButtonText: 'Register',
        centerBackground: true,
        onFinish: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const FirstPage()),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              'images/onboarding4.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
        totalPage: 4,
        speed: 1,
        pageBodies: [
          OnboardingInfoWidget(
            title: "STRESS LESS.",
            subtitle:
                "Make mindfulness a daily habit and be kind to your mind.",
          ),
          OnboardingInfoWidget(
            title: "RELAX MORE.",
            subtitle:
                "Unwind and find serenity in a guided meditation sessions.",
          ),
          OnboardingInfoWidget(
            title: "SLEEP LONGER.",
            subtitle: "Calm racing mind and prepare your body for deep sleep.",
          ),
          OnboardingInfoWidget(
            title: "LIVE BETTER.",
            subtitle: "Invest in personal sense of inner peace and balance.",
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
