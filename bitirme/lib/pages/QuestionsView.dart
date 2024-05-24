// ignore_for_file: sort_child_properties_last

import 'package:bitirme/Constants/Constants.dart';
import 'package:bitirme/ViewModels/QuestionsPageViewModel.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 51, 40, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 32, left: 18, right: 18),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<QuestionsPageViewModel>().decProcess();
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),
                    SizedBox(width: 6),
                    SimpleAnimationProgressBar(
                      height: 14,
                      width: MediaQuery.of(context).size.width / 1.28,
                      backgroundColor: Colors.grey,
                      foregrondColor: greenGradientStart,
                      ratio: context.watch<QuestionsPageViewModel>().process,
                      direction: Axis.horizontal,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(seconds: 3),
                      borderRadius: BorderRadius.circular(10),
                      gradientColor: LinearGradient(
                          colors: [greenGradientStart, greenGradientEnd]),
                    ),
                  ],
                ),
                SizedBox(height: 42),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      child: child,
                      position: Tween<Offset>(
                              begin: Offset(0.0, -0.5), end: Offset(0.0, 0.0))
                          .animate(animation),
                    );
                  },
                  child: Text(
                    context.watch<QuestionsPageViewModel>().questions[
                        context.watch<QuestionsPageViewModel>().liveIndex],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 32),
                context.watch<QuestionsPageViewModel>().liveIndex == 0
                    ? Column(
                        children: [
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Text(
                                "Height",
                                style: GoogleFonts.manrope(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          InfoTextfield(
                            trailingText: "cm",
                            controller: context
                                .watch<QuestionsPageViewModel>()
                                .heightController,
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
                              Text(
                                "Weight",
                                style: GoogleFonts.manrope(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          InfoTextfield(
                            trailingText: "kg",
                            controller: context
                                .watch<QuestionsPageViewModel>()
                                .weightController,
                          ),
                          SizedBox(height: 48),
                          Row(
                            children: [
                              Text(
                                "BMI : ",
                                style: GoogleFonts.manrope(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                  context
                                      .watch<QuestionsPageViewModel>()
                                      .bmiValue
                                      .toStringAsFixed(2),
                                  style: GoogleFonts.manrope(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              SizedBox(width: 12),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<QuestionsPageViewModel>()
                                        .calculateBmiValue();
                                  },
                                  child: Text("Calculate"))
                            ],
                          )
                        ],
                      )
                    : context.watch<QuestionsPageViewModel>().liveIndex == 3
                        ? const Question1Buttons()
                        : Text("deneme"),
                Spacer(),
                SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0],
                        colors: [
                          greenGradientStart,
                          greenGradientEnd,
                        ],
                      ),
                      color: green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () async {
                        context.read<QuestionsPageViewModel>().incProcess();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTextfield extends StatelessWidget {
  String trailingText;
  TextEditingController controller;

  InfoTextfield(
      {super.key, required this.trailingText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          style: GoogleFonts.manrope(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
              focusColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(
            trailingText,
            style: GoogleFonts.manrope(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class Question1Buttons extends StatelessWidget {
  const Question1Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionButton(
          index: 0,
          text: "Relax more",
          questionNumber: 1,
        ),
        QuestionButton(
          index: 1,
          text: "Sleep better",
          questionNumber: 1,
        ),
        QuestionButton(
          index: 2,
          text: "Learn to meditate",
          questionNumber: 1,
        ),
        QuestionButton(
          index: 3,
          text: "Reduce anxiety",
          questionNumber: 1,
        ),
      ],
    );
  }
}

class QuestionButton extends StatelessWidget {
  int index;
  String text;
  int questionNumber;
  QuestionButton(
      {super.key,
      required this.index,
      required this.text,
      required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () async {
              if (questionNumber == 1) {
                context
                    .read<QuestionsPageViewModel>()
                    .changeQuestion1Index(index);
              }
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                backgroundColor: index ==
                        context.watch<QuestionsPageViewModel>().question1Index
                    ? Color.fromRGBO(88, 118, 111, 1)
                    : navbarBg),
          )),
    );
  }
}