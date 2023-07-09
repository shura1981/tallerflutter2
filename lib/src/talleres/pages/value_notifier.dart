import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ValueNotifierScreen extends StatelessWidget {
  ValueNotifierScreen({Key? key}) : super(key: key);
  final ValueNotifier<DateTime> _valueNotfier = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Timer.periodic(new Duration(seconds: 1), (timer) {
      //  debugPrint(timer.tick.toString());
      _valueNotfier.value = DateTime.now();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifierScreen'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ValueListenableBuilder<DateTime>(
                builder: (BuildContext context, value, Widget? child) {
                  String formattedTime = DateFormat.Hms().format(value);
                  double screenWidth = MediaQuery.of(context).size.width * 0.78;
                  return SizedBox(
                    width: screenWidth,
                    child: Text(
                      formattedTime,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 80),
                    ),
                  );
                },
                valueListenable: _valueNotfier,
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
