import 'package:flutter/material.dart';
import 'package:bitirme/generated/l10n.dart';
import 'package:bitirme/models/result_model.dart';

class ResultPage extends StatelessWidget {
  ResultModel? response;
  ResultPage({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(6, 51, 40, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).testResult,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                ": ${response!.outcome.toString()}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${S.of(context).diseaseStatus} : ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${response!.prediction.toString()}",
                  maxLines: null,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
