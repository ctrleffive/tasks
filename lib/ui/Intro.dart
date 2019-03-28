import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              children: <Widget>[
                _SingleItem(),
                _SingleItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset('assets/images/intro/intro-1.svg', 
            width: MediaQuery.of(context).size.width / 2
            ),
          Text('Never more in rush', style: TextStyle(
            fontSize: 30
          ),),
          Text('Check and keep under controll your daily tasks, is a creative way.'),
        ],
      ),
    );
  }
}