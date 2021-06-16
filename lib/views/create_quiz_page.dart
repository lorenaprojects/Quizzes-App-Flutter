// Copyright 2021 Lorena Munoz. //
// All rights reserved. Lorena projects //

import 'package:flutter/material.dart';
import 'package:quiz2lore/views/main_page.dart';

class CreateQuizPage extends StatefulWidget {
  @override
  _CreateQuizPageState createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  String inputText = "Add_Title_of_Quiz_MAX_12_Characters";
  String inputAnswer1 = "Add_Content_of_Option_1__MAX_25_Characters";
  String inputAnswer2 = "Add_Content_of_Option_2__MAX_25_Characters";
  String inputAnswer3 = "Add_Content_of_Option_3__MAX_25_Characters";
  String inputAnswer4 = "Add_Content_of_Option_4__MAX_25_Characters";
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;

  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;

  Widget reusableOptionInput(int optionNumber) {
    bool getValue() {
      if (optionNumber == 1) {
        return checkBoxValue1;
      } else if (optionNumber == 2) {
        return checkBoxValue2;
      } else if (optionNumber == 3) {
        return checkBoxValue3;
      } else {
        return checkBoxValue4;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(labelText: 'Put Option here'),
            onChanged: (String inputAnswer) {
              if (optionNumber == 1) {
                inputAnswer1 = inputAnswer;
              } else if (optionNumber == 2) {
                inputAnswer2 = inputAnswer;
              } else if (optionNumber == 3) {
                inputAnswer3 = inputAnswer;
              } else if (optionNumber == 4) {
                inputAnswer4 = inputAnswer;
              } else {}
            },
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Checkbox(
          onChanged: (bool isCorrect) {
            setState(() {
              if (optionNumber == 1) {
                checkBoxValue1 = isCorrect;
              } else if (optionNumber == 2) {
                checkBoxValue2 = isCorrect;
              } else if (optionNumber == 3) {
                checkBoxValue3 = isCorrect;
              } else if (optionNumber == 4) {
                checkBoxValue4 = isCorrect;
              } else {}
            });

            if (optionNumber == 1) {
              answer1 = isCorrect;
            } else if (optionNumber == 2) {
              answer2 = isCorrect;
            } else if (optionNumber == 3) {
              answer3 = isCorrect;
            } else if (optionNumber == 4) {
              answer4 = isCorrect;
            } else {}
          },
          value: getValue(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Put your Question Here',
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              onChanged: (String input) {
                inputText = input;
              },
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 450,
              ),
              Text(
                'Select the Correct Answer',
              ),
            ],
          ),
          SizedBox(
            height: 64,
          ),
          Column(
            children: <Widget>[
              reusableOptionInput(1),
              reusableOptionInput(2),
              reusableOptionInput(3),
              reusableOptionInput(4),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainPage(
                  question: inputText,
                  option1: inputAnswer1,
                  option2: inputAnswer2,
                  option3: inputAnswer3,
                  option4: inputAnswer4,
                  optionAnswer1: answer1,
                  optionAnswer2: answer2,
                  optionAnswer3: answer3,
                  optionAnswer4: answer4,
                );
              }));
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
