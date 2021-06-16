// Copyright 2021 Lorena Munoz. //
// All rights reserved. Lorena projects //

import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 50, top: 64, bottom: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "ADD_TITLE_QUIZ_1",
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
//          Icon(
//            Icons.dashboard,
//            color: Colors.white,
//            size: 30.0,
//          ),
        ],
      ),
    );
  }
}
