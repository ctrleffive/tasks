import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/models/page.dart';
import 'package:tasks/ui/home.dart';
import 'package:tasks/ui/partials/paginator.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final StreamController<int> _paginationStream = StreamController<int>();
  final List<IntroPage> _pages = [
    IntroPage(
      id: 1,
      title: 'Never more in rush',
      subTitle: 'Check and keep under controll your daily tasks, is a creative way.',
    ),
    IntroPage(
      id: 2,
      title: 'Never more in rush',
      subTitle: 'Check and keep under controll your daily tasks, is a creative way.',
    ),
  ];

  @override
  void dispose() {
    _paginationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              onPageChanged: this._paginationStream.sink.add,
              physics: BouncingScrollPhysics(),
              itemCount: this._pages.length,
              itemBuilder: (_, int index) => _SingleItem(this._pages[index]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: StreamBuilder<int>(
              initialData: 0,
              stream: this._paginationStream.stream,
              builder: (_, AsyncSnapshot<int> pageSnap) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Paginator(
                      totalPages: this._pages.length,
                      activePage: pageSnap.data,
                    ),
                    AnimatedOpacity(
                      opacity: this._pages.length == pageSnap.data + 1 ? 1 : 0,
                      duration: Duration(milliseconds: 200),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Home(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.white10,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleItem extends StatelessWidget {
  final IntroPage page;

  _SingleItem(this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: SvgPicture.asset(
              'assets/images/intro/intro-${this.page.id}.svg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fitWidth,
              placeholderBuilder: (_) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          SizedBox(height: 40),
          Text(
            this.page.title,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          SizedBox(height: 10),
          Text(
            this.page.subTitle,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
