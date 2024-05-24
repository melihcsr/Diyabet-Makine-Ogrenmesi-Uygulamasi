import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitirme/generated/l10n.dart';
import 'package:bitirme/pages/result_page.dart';
import 'package:bitirme/services/service.dart';

class DataPage extends StatelessWidget {
  final double weightIndex;
  DataPage({super.key, required this.weightIndex});
  var gebelikSayisi = TextEditingController();
  var glukozDegeri = TextEditingController();
  var kanBasinciDegeri = TextEditingController();
  var deriInceligiDegeri = TextEditingController();
  var insulinDegeri = TextEditingController();
  var soyagaciDegeri = TextEditingController();
  var yas = TextEditingController();

  void postData() async {
    var url = Uri.parse("http://10.0.2.2:8000/predict-lgbm");
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).pregnancyCount,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: gebelikSayisi,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).glucoseValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: glukozDegeri,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).bloodPressureValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: kanBasinciDegeri,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).skinThicknessValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: deriInceligiDegeri,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).insulinValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: insulinDegeri,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).bmiValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                Text(
                  weightIndex.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).diabetesPedigree,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: soyagaciDegeri,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Text(
                  S.of(context).age,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: pageWidth / 35),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                      controller: yas,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(
                            height: 2.7,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        fillColor: Colors.white,
                      )),
                ),
                SizedBox(height: pageWidth / 16),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Service()
                              .apiCall(
                                  pregnancies: int.parse(gebelikSayisi.text),
                                  glucose: int.parse(glukozDegeri.text),
                                  blood_pressure:
                                      int.parse(kanBasinciDegeri.text),
                                  skin_thickness:
                                      int.parse(deriInceligiDegeri.text),
                                  insulin: int.parse(insulinDegeri.text),
                                  diabetes_pedigree_function:
                                      double.parse(soyagaciDegeri.text),
                                  bmi: weightIndex,
                                  age: int.parse(yas.text))
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                            response: value,
                                          ))));
                        },
                        child: Text(
                          S.of(context).calculateButton,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ))),
                SizedBox(height: pageWidth / 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
