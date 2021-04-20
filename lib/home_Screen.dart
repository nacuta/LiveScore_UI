import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222232),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 39, 24, 0),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff222232),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "LiveScore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search_rounded),
                      color: Colors.white,
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 197,
                  // color: Colors.amberAccent,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Positioned(
                        child: Container(
                          height: 157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff246bfd), Color(0xff0c0c69)],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SportCard(),
                              SizedBox(
                                width: 158,
                                child: Text(
                                  "Liverpool UEFA Champion League\nCelebration",
                                  style: GoogleFonts.sourceSansPro(
                                      color: Colors.white,
                                      fontSize: 18,
                                      height: 1.3,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Yesterday, 06.30 PM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width - 231,
                        child: Image.asset(
                          'assets/images/image-removebg.png',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  const SportCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 80,
          height: 23,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: Image.asset(
                    'assets/images/soccer.png',
                  ),
                ),
              ),
              SizedBox(width: 6),
              Text(
                "Football",
                style: GoogleFonts.sourceSansPro(
                    color: Color(0xff181829),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
