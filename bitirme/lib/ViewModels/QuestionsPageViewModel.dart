import 'package:flutter/material.dart';

class QuestionsPageViewModel extends ChangeNotifier {
  int question1Index = 0;
  int question2Index = 0;
  int question3Index = 0;
  int question4Index = 0;

  int liveIndex = 0;

  double process = 0.25;

  int minuteSelection = 5;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController pregnanciesController = TextEditingController();
  TextEditingController glucoseController = TextEditingController();
  TextEditingController bloodPressuseController = TextEditingController();
  TextEditingController skinThicknessController = TextEditingController();
  TextEditingController insulinController = TextEditingController();
  TextEditingController generationController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  double bmiValue = 0.0;

  List<String> questions = [
    "Enter your body measurements.",
    "Do you experience any of following?",
    "Do you have experience with meditation?",
    "How many mindful minutes would you like to have in a day?"
  ];

  void calculateBmiValue() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    bmiValue = (weight / ((height / 100) * (height / 100)));
    notifyListeners();
  }

  void changeMinuteSelection(int minute) {
    minuteSelection = minute;
    notifyListeners();
  }

  void changeQuestion1Index(int newIndex) {
    question1Index = newIndex;
    notifyListeners();
  }

  void incProcess() {
    process = process + 0.25;
    liveIndex++;
    notifyListeners();
  }

  void decProcess() {
    process = process - 0.25;
    liveIndex--;
    notifyListeners();
  }
}
