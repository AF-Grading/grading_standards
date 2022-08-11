import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  50,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 100,
                      child: Text('The Problem Statement: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        Text(
                            '      Currently, the Air Force has no complete centralized set of standards for grading incoming C-17 pilots. Besides that, there is no statistical analysis or regression analysis between instructors. To remedy that, the 62nd Airlift Wing over at Joint Base Lewis-McChord has tasked us with creating an application capable of handling record creation and on-device analysis.\n'),
                        Text(
                            '      Although these functionalities are easy enough to implement, there are additional concerns. Getting the application to a level of security high enough that it can be used on the Electronic Flight Bag is our primary goal. We believe it important that the continuous development pipeline be set up as well so that the application can gain value over time. Finally, we also hope to achieve a clean, easy-to-use UI.')
                      ]),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  50,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 100,
                      child: Text('Our Solution: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        Text(
                            '      The product that you are currenly using is the Mobile Application Solution that we came up with. We addressed the few issues in the following fasion:\n'),
                        Text(
                            '1. Accessible from anywhere and any place (as long as you log in while you have an internet connection). We know that pilots are busy people constantly on the move, so we made sure that this solution is accessible from any device. You can download the app to your iOS devices (including iPod if you still have one) and Android devices. You can also access all of the same web features and have the same data as you would have if you access it from your mobile device.\n'),
                        Text(
                            '2. It saves data locally once you log in on mobile devices. Since this app was created with the idea of simplifying the pilot grading process, we took into account the fact that there will be no internet when you are on a mission flying thousands of feet above the ground. We made sure that your grade sheets will be saved locally, and you can upload the data to the cloud once you are connected to the internet (given you land safely). But you MUST have an internet connection when you are login in.\n'),
                        Text(
                            '3. Good quality of life implementations. We worked closely with our problem sponsor, Captain Byron Gray, a C-17 pilot, to ensure the app had many quality-of-life features. For example, you will be able to copy grade sheets to import them into another document easily; the implementation of the dark mode, so you don\'t get blinded at night when you are looking at your screen and plenty of others.\n'),
                        Text(
                            '4. Good User Interface that makes your life easier. We had an opportunity to look at the old ways the pilots managed the grade sheets, and we vowed not to step down to that level. That\'s why we made our app as intuitive as possible for people to use (and decently pleasant on the eyes).\n')
                      ]),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  50,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 100,
                      child: Text('About This Project',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        Text(
                            '      This project is developed by Kegan Flagg (U Hawaii, 2022) and Runsen Wu (U Washington, 2024) in the summer of 2022 in 10 weeks under the X-Force program by NSIN (National Security Innovation Network). The original project sponsor is Captain Byron Gray, whom we worked closely with alongside First Lieutenant Kira Headrick.'),
                      ]),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  50,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 100,
                      child: Text('Contact Us',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(children: [
                        Text('Kegan Flagg: flagg.kt@gmail.com '),
                        Text('Runsen Wu: runsenwu460@gmail.com'),
                      ]),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
