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
    Icon(Icons.male,
        color: CupertinoColors.activeGreen, size: 100),
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
      child: Scaffold(backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                  // color: Colors.grey[300],
                ),

                padding: EdgeInsets.only(left: 15),
                // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Dashboard',
                          style: GoogleFonts.montserratAlternates(
                              color: Colors.pinkAccent,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddUser(
                                  model: null,
                                ),
                              ),
                            );

                        },
                        child: Stack(
                          children: [
                            Lottie.asset('assets/images/profile_animation.json',
                                controller: _controller, height: 85),
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 60, 0, 0),
                                child: Text(
                                  'Add User',
                                  style: GoogleFonts.montserratAlternates(
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 100, 20, 20),
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
                              color: Colors.purple[100]),
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
