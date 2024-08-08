import 'package:first_app/screens/home_Page.dart';
import 'package:first_app/Models/onboardData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool lastPage = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Stack(children: [
        PageView(
          onPageChanged: (v) {
            setState(() {
              lastPage = (v == 2);
            });
          },
          controller: _controller,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //onboarding1
                Image.asset(
                  onboarding[0].Image,
                  height: 220,
                ),

                Divider(
                  endIndent: 50,
                  indent: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  onboarding[0].title,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineSmall),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  onboarding[0].subtitle,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //onboarding1
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.asset(
                    onboarding[1].Image,
                    height: 220,
                  ),
                ),

                Divider(
                  endIndent: 50,
                  indent: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(onboarding[1].title,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headlineSmall)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  textAlign: TextAlign.center,
                  onboarding[1].subtitle,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //onboarding1
                Container(
                  child: Image.asset(
                    onboarding[2].Image,
                    height: 220,
                  ),
                ),

                Divider(
                  endIndent: 50,
                  indent: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  onboarding[2].title,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineSmall),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  onboarding[2].subtitle,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(49.0),
                  child: Positioned(
                      bottom: 50,
                      left: 155,
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Theme.of(context).primaryColorLight,
                            dotWidth: 12,
                            dotHeight: 12,
                            dotColor: Theme.of(context).primaryColor),
                      )),
                ),
              ],
            ),
          ],
        ),
        lastPage
            ? Positioned(
                bottom: 45,
                right: 50,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 130, 128, 128),
                          offset: Offset(0.0, 7.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Done",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                        ),
                        Icon(color: Colors.white, Icons.arrow_right)
                      ],
                    ),
                  ),
                ))
            : Container()
      ]),
    );
  }
}
