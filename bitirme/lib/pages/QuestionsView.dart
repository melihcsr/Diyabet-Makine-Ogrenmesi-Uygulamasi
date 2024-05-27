// ignore_for_file: sort_child_properties_last

import 'package:bitirme/Constants/Constants.dart';
import 'package:bitirme/ViewModels/QuestionsPageViewModel.dart';
import 'package:bitirme/pages/result_page.dart';
import 'package:bitirme/services/service.dart';
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
                SizedBox(height: 32),
                context.watch<QuestionsPageViewModel>().liveIndex == 0
                    ? BmiCalculate()
                    : context.watch<QuestionsPageViewModel>().liveIndex == 1
                        ? QuestionsIndex1()
                        : context.watch<QuestionsPageViewModel>().liveIndex == 2
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Insulin Value",
                                    style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 12),
                                  InfoTextfield(
                                      trailingText: "",
                                      controller: context
                                          .watch<QuestionsPageViewModel>()
                                          .insulinController),
                                  Text(
                                    "How many generations have diabetes?",
                                    style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 12),
                                  InfoTextfield(
                                      trailingText: "",
                                      controller: context
                                          .watch<QuestionsPageViewModel>()
                                          .generationController),
                                  Text(
                                    "Age",
                                    style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 12),
                                  InfoTextfield(
                                      trailingText: "",
                                      controller: context
                                          .watch<QuestionsPageViewModel>()
                                          .ageController),
                                ],
                              )
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
                        if (Provider.of<QuestionsPageViewModel>(context,
                                    listen: false)
                                .process ==
                            0.75) {
                          print("deneme");
                          Service()
                              .apiCall(
                                  pregnancies: int.parse(
                                      Provider.of<QuestionsPageViewModel>(context, listen: false)
                                          .pregnanciesController
                                          .text),
                                  glucose: int.parse(
                                      Provider.of<QuestionsPageViewModel>(context, listen: false)
                                          .glucoseController
                                          .text),
                                  blood_pressure: int.parse(
                                      Provider.of<QuestionsPageViewModel>(context, listen: false)
                                          .bloodPressuseController
                                          .text),
                                  skin_thickness: int.parse(
                                      Provider.of<QuestionsPageViewModel>(context, listen: false)
                                          .skinThicknessController
                                          .text),
                                  insulin:
                                      int.parse(Provider.of<QuestionsPageViewModel>(context, listen: false).insulinController.text),
                                  diabetes_pedigree_function: double.parse(Provider.of<QuestionsPageViewModel>(context, listen: false).generationController.text),
                                  bmi: Provider.of<QuestionsPageViewModel>(context, listen: false).bmiValue,
                                  age: int.parse(Provider.of<QuestionsPageViewModel>(context, listen: false).ageController.text))
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            response: value,
                                          ))));
                        }
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

class QuestionsIndex1 extends StatelessWidget {
  const QuestionsIndex1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Number of Pregnancies",
          style: GoogleFonts.manrope(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 12),
        InfoTextfield(
            trailingText: "",
            controller:
                context.watch<QuestionsPageViewModel>().pregnanciesController),
        Text(
          "Glucose Value",
          style: GoogleFonts.manrope(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 12),
        InfoTextfield(
            trailingText: "",
            controller:
                context.watch<QuestionsPageViewModel>().glucoseController),
        Text(
          "Blood Pressure Value",
          style: GoogleFonts.manrope(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 12),
        InfoTextfield(
            trailingText: "",
            controller: context
                .watch<QuestionsPageViewModel>()
                .bloodPressuseController),
        Text(
          "Skin Thickness Value",
          style: GoogleFonts.manrope(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 12),
        InfoTextfield(
            trailingText: "",
            controller: context
                .watch<QuestionsPageViewModel>()
                .skinThicknessController),
      ],
    );
  }
}

class BmiCalculate extends StatelessWidget {
  const BmiCalculate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: context.watch<QuestionsPageViewModel>().heightController,
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
          controller: context.watch<QuestionsPageViewModel>().weightController,
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
          ],
        )
      ],
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          SizedBox(
            height: 42,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller,
              scrollPadding: EdgeInsets.all(0),
              onChanged: (value) {
                if (double.parse(Provider.of<QuestionsPageViewModel>(context,
                            listen: false)
                        .weightController
                        .text) !=
                    0.0) {
                  Provider.of<QuestionsPageViewModel>(context, listen: false)
                      .calculateBmiValue();
                }
              },
              style: GoogleFonts.manrope(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12),
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.5, color: Colors.white))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              trailingText,
              style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
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
