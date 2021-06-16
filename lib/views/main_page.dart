// Copyright 2021 Lorena Munoz. //
// All rights reserved. Lorena projects //

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz2lore/components/nav_bar.dart';
import 'package:quiz2lore/views/create_quiz_page.dart';
import 'package:quiz2lore/views/result_page.dart';

int finalScore = 0;
int questionNumber = 0;
int choiceNumber = 0;

class NewQuiz {
  var questions = [
    "Add_Content_of_Quiz_or_Challenge_Scenario_1_MAX_40_Characters",
//    "Add_Content_of_Quiz_or_Challenge_Scenario_2_MAX_40_Characters",
  ];

  List<String> choices = [
    "Opt.1", "Opt.2", "Opt.3", "Opt.4",
//    ["Business", "Sunshine", "Life", "Rock"],
  ];

  String correctAnswers = "Opt.1";
}

class MainPage extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final bool optionAnswer1;
  final bool optionAnswer2;
  final bool optionAnswer3;
  final bool optionAnswer4;
  MainPage(
      {this.question = "Add_Title_of_Quiz_MAX_12_Characters",
      this.option1 = "Add_Content_of_Option_1__MAX_25_Characters",
      this.option2 = "Add_Content_of_Option_2__MAX_25_Characters",
      this.option3 = "Add_Content_of_Option_3__MAX_25_Characters",
      this.option4 = "Add_Content_of_Option_4__MAX_25_Characters",
      this.optionAnswer1 = true,
      this.optionAnswer2 = false,
      this.optionAnswer3 = false,
      this.optionAnswer4 = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//  TextEditingController categoryController = TextEditingController(),
//  int questionNo = 0;
//  Timer timer;

  NewQuiz quiz = NewQuiz();

  int selectedPageIndex = 0;

  void checkAnswer(bool isRight) {
    if (isRight) {
      print('right');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ResultPage(
            isCorrect: true,
          );
        }),
      );
    } else {
      print('wrong');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ResultPage(
            isCorrect: false,
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ////---to set rotation of Page---//
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: 0,
        onTap: (int currentPageIndex) {
          setState(() {
            selectedPageIndex = currentPageIndex;
          });
        },
        backgroundColor: Colors.blue.shade800,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit,
            ),
            title: Text(''),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: selectedPageIndex == 0
          ? Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    NavigationBar(),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 64, top: 124, bottom: 64, right: 64),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "images/youcandoit.jpg",
                                    width: 300,
                                    height: 300,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                              //Title column
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      widget.question,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 5.0),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
//                              Text(
//                                quiz.questions[questionNumber][0],
//                                style: TextStyle(
//                                    color: Colors.white, fontSize: 15.0),
//                              ),
                                        Text(
                                          quiz.questions[questionNumber][0],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: RaisedButton(
                                            onPressed: () {
                                              checkAnswer(widget.optionAnswer1);
                                            },
                                            hoverColor: Colors.lightBlue,
                                            hoverElevation: 10.0,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0))),
                                            color: Colors.purple,
                                            child: Text(
                                              quiz.choices[choiceNumber],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.option1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: RaisedButton(
                                            onPressed: () {
                                              checkAnswer(widget.optionAnswer2);
                                            },
                                            hoverColor: Colors.lightBlue,
                                            hoverElevation: 10.0,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0))),
                                            color: Colors.purple,
                                            child: Text(
                                              quiz.choices[1],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.option2,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: RaisedButton(
                                            onPressed: () {
                                              checkAnswer(widget.optionAnswer3);
                                            },
                                            hoverColor: Colors.lightBlue,
                                            hoverElevation: 10.0,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0))),
                                            color: Colors.purple,
                                            child: Text(
                                              quiz.choices[2],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.option3,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: RaisedButton(
                                            onPressed: () {
                                              checkAnswer(widget.optionAnswer4);
                                            },
                                            hoverColor: Colors.lightBlue,
                                            hoverElevation: 10.0,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0))),
                                            color: Colors.purple,
                                            child: Text(
                                              quiz.choices[3],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.option4,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
//                      Column(
//                        children: <Widget>[
//                          Row(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              SizedBox(
//                                height: 50,
//                                width: 70,
//                                child: RaisedButton(
//                                  onPressed: resetQuiz,
//                                  hoverColor: Colors.greenAccent,
//                                  hoverElevation: 10.0,
//                                  elevation: 2,
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.only(
//                                          bottomLeft: Radius.circular(0),
//                                          topRight: Radius.circular(0))),
//                                  color: Colors.red,
//                                  child: Text(
//                                    'finish',
//                                    style: TextStyle(
//                                        color: Colors.white, fontSize: 15.0),
//                                  ),
//                                ),
//                              ),
//                        ],
//                      ),
//                    ],
//                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : CreateQuizPage(),
    );
  }
}

//void resetQuiz(){
//  setState(() {
//    Navigator.pop(context);
//    finalScore = 0;
//    questionNumber = 0;
//  });
//}

//void finalQuestion(){
//  setState(() {
//if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]) {
//debugPrint("Correct");
//finalScore++;
//}else{
//debugPrint("Wrong");
//}
//updateQuestion();
//},

//void updateQuestion(){
//  setState(() {
//    if(questionNumber == quiz.questions.length - 1){
//      Navigator.push(context, MaterialPageRoute(builder: (context)=> Summary(score: finalScore,)));
//
//    }else{
//      questionNumber++;
//    }
//  });
//}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Final Score: $score",
                style: new TextStyle(fontSize: 35.0),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text(
                  "Reset Quiz",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
