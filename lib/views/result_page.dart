// Copyright 2021 Lorena Munoz. //
// All rights reserved. Lorena projects //

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final bool isCorrect;

  ResultPage({this.isCorrect});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: isCorrect == true
                      ? Image.asset('images/happy.jpg')
                      : Image.asset('images/try.jpg'),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  isCorrect == true ? 'You got it right!' : 'Try again!',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
