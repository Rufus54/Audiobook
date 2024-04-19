import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'book_data.dart';
import 'book_model.dart';

class BooksListen extends StatefulWidget {
  final int index;
  final String section;

  BooksListen({required this.index, required this.section});

  @override
  State<BooksListen> createState() => _BookLState();
}

class _BookLState extends State<BooksListen> {

  bool playing = false;
  IconData playbtn = Icons.play_arrow;

  Duration position = new Duration();
  Duration leng = new Duration();


  final player = AudioPlayer();


  double currentPosition = 0.0;
  double? audioDuration;


  void initState() {
    super.initState();
    player.onPositionChanged.listen((position) => setState(() => currentPosition = position.inSeconds.toDouble()));

    player.onDurationChanged.listen((duration) => setState(() => audioDuration = duration?.inSeconds?.toDouble()));


  }



  String formatDuration(double seconds) {
    Duration duration = Duration(seconds: seconds.toInt());
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String secondsStr = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secondsStr';
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  List<int> Heights = [];

  List<Book> bookList =[];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < MediaQuery.of(context).size.width / 9.3; i++) {
      Heights.add(Random().nextInt(50));
    }
    if (widget.section == "Continue Reading") {
      bookList = recentBooks;
    } else if (widget.section == "Discover More") {
      bookList = allBooks;
    }
    else if (widget.section == "Latest Release") {
      bookList = upcomingBooks;
    }
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bookList[widget.index].coverImage),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.1),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 25,
                                offset: Offset(8, 8),
                                spreadRadius: 3,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 25,
                                offset: Offset(-8, -8),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              // "assets/images/0.jfif",
                              bookList[widget.index].coverImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: new LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    // "Conjure Women",
                    bookList[widget.index].name,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    //"By Afia Atakora",
                    "By ${bookList[widget.index].author}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Chapter 2",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Column(
                            children: [
                              Text("${formatDuration(currentPosition)}",style: TextStyle(fontSize: 20,color: Colors.black),),

                              Slider(
                                activeColor: Colors.teal,
                                value: currentPosition,
                                min: 0.0,
                                // Use audioDuration if available, otherwise default to 0
                                max: audioDuration ?? 0.0,
                                onChanged: (value) async {
                                  await player.seek(Duration(seconds: value.toInt()));
                                  setState(() => currentPosition = value);
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  IconButton(
                                    iconSize: 50,
                                    onPressed: () {},
                                    icon: Icon(Icons.skip_previous_sharp,color: Colors.black,),
                                  ),
                                  IconButton(
                                    color: Colors.black,
                                    iconSize: 60,
                                    onPressed: () {
                                      if (!playing) {
                                        setState(() {
                                          playbtn = Icons.pause_circle;
                                          playing = true;
                                          player.play(AssetSource("songs/ad.mp3"));
                                        });
                                      } else {
                                        setState(() {
                                          playbtn = Icons.play_circle;
                                          playing = false;
                                          player.pause();
                                        });
                                      }
                                    },
                                    icon: Icon(playbtn),
                                  ),
                                  IconButton(
                                    color: Colors.black,
                                    iconSize: 50,
                                    onPressed: () {},
                                    icon: Icon(Icons.skip_next),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


