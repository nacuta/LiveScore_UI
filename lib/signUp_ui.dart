import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_profile_screen/home_Screen.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222232),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              color: Color(0xff222232),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 60, 28, 51),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 267,
                      child: Text(
                        "What sport do you interest?",
                        style: GoogleFonts.sourceSansPro(
                            color: Colors.white,
                            fontSize: 36,
                            height: 1.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "You can choose more than one",
                      style: TextStyle(
                        color: Color(0xff65656b),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 49,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: GridView.count(
                        crossAxisSpacing: 0.0,
                        //The spacing between vertical sub-widgets
                        mainAxisSpacing: 20,
                        //GridView padding
                        padding: EdgeInsets.all(1.0),
                        //The number of Widgets in a row
                        crossAxisCount: 3,
                        //Child Widget aspect ratio
                        childAspectRatio: 1,
                        children: [
                          BuildSportsLogo(
                              sportTittle: 'Soccer', imageName: 'soccer'),
                          BuildSportsLogo(
                              sportTittle: 'Basketball',
                              imageName: 'basketball'),
                          BuildSportsLogo(
                              sportTittle: 'Football', imageName: 'football'),
                          BuildSportsLogo(
                              sportTittle: 'Baseball', imageName: 'baseball'),
                          BuildSportsLogo(
                              sportTittle: 'Tennis', imageName: 'tennis'),
                          BuildSportsLogo(
                              sportTittle: 'Volleyball',
                              imageName: 'volleyball'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 63,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Continue',
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.purple,
                          backgroundColor: Color(0xff246bfd),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => HomeScreen());
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildSportsLogo extends StatefulWidget {
  const BuildSportsLogo({
    Key? key,
    @required this.imageName,
    @required this.sportTittle,
  }) : super(key: key);
  final String? imageName;
  final String? sportTittle;
  @override
  _BuildSportsLogoState createState() => _BuildSportsLogoState();
}

List<Color> gradientNotSelected = [Color(0xff222232), Color(0xff222232)];
List<Color> gradientSelected = [Color(0xfff4a58a), Color(0xffed6b4e)];
List<Color> _gradient = gradientNotSelected;

class _BuildSportsLogoState extends State<BuildSportsLogo> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          print('tap');
          _gradient = isTap ? gradientNotSelected : gradientSelected;
          isTap = !isTap;
          print(isTap);
        });
      },
      highlightColor: Colors.red[300],
      child: Container(
        width: 100,
        height: 121,
        // color: Colors.blueAccent,
        child: Column(
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _gradient),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/${widget.imageName}.png',
                width: 44,
                height: 44,
              ),
            ),
            // SizedBox(
            //   height: 6,
            // ),
            Text(
              widget.sportTittle!,
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
