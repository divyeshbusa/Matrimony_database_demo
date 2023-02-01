import 'package:final_matrimony/pages/add_user.dart';

import 'package:final_matrimony/pages/favourite_user_list.dart';
import 'package:final_matrimony/pages/female_user_list.dart';
import 'package:final_matrimony/pages/male_user_list.dart';
import 'package:final_matrimony/pages/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool bookmarked = false;

  List<Icon> cardIcon = [
    Icon(CupertinoIcons.list_dash, color: Color(0xFFCB84FB), size: 100),
    Icon(Icons.favorite, color: Colors.pinkAccent, size: 100),
    Icon(Icons.male, color: CupertinoColors.activeGreen, size: 100),
    Icon(Icons.female, color: Color(0xFFFC7F7F), size: 100),
  ];

  List cardName = [
    "List Of Profiles",
    "Favourite",
    "MEN",
    "WOMEN",
  ];

  List<Color> cardColor = [
    Color(0xFFCB84FB),
    Color(0xFF6FFF8D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
  ];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 10,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 45),
                    child: Text(
                      'Dashboard',
                      style: GoogleFonts.montserratAlternates(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'and so the',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'GreatVibes-Regular',
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(5, 5),
                            ),
                          ]),
                    )),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adventure begins...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'GreatVibes-Regular',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  // color of the shadow
                                  color: Colors.black38,
                                  offset: Offset(5, 5),
                                ),
                              ]),
                        ),
                        Text(
                          '🤍',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'GreatVibes-Regular',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  // color of the shadow
                                  color: Colors.black38,
                                  offset: Offset(5, 5),
                                ),
                              ]),
                        ),
                      ],
                    )),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              ListTile(
                title: Text('ADD USER'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddUser(
                        model: null,
                      ),
                    ),
                  );
                },
              ),
              // ListTile(
              //   title: Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: cardName.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UserList(cardName[index]),
                                ));
                          }
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavouriteUser(),
                                ));
                          }
                          if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => maleUser(),
                                ));
                          }
                          if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => femaleUser(),
                                ));
                          }
                          if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => femaleUser(),
                                ));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300]),
                          child: Column(children: [
                            cardIcon[index],
                            SizedBox(height: 5),
                            Text(
                              cardName[index],
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ]),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
