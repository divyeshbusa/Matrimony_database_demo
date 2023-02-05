import 'package:final_matrimony/Login_pages/login_page.dart';
import 'package:final_matrimony/pages/add_user.dart';

import 'package:final_matrimony/pages/favourite_user_list.dart';
import 'package:final_matrimony/pages/female_user_list.dart';
import 'package:final_matrimony/pages/male_user_list.dart';
import 'package:final_matrimony/pages/user_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

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
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool bookmarked = false;

  List<Icon> cardIcon = [
    const Icon(CupertinoIcons.list_dash, color: Color(0xFFCB84FB), size: 100),
    const Icon(Icons.favorite, color: Colors.pinkAccent, size: 100),
    const Icon(Icons.male, color: CupertinoColors.activeGreen, size: 100),
    const Icon(Icons.female, color: Color(0xFFFC7F7F), size: 100),
  ];

  List cardName = [
    "List Of Profiles",
    "Favourite",
    "MEN",
    "WOMEN",
  ];

  List<Color> cardColor = [
    const Color(0xFFCB84FB),
    const Color(0xFF6FFF8D),
    const Color(0xFF61BDFD),
    const Color(0xFFFC7F7F),
  ];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.pink[500],
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            shape: const ContinuousRectangleBorder(
              side: BorderSide(
                  color: Colors.black, strokeAlign: StrokeAlign.outside),
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
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        'Dashboard',
                        style: GoogleFonts.montserratAlternates(
                            color: Colors.pink[500],
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
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.pink,
                        Colors.purple,
                        Colors.purpleAccent
                      ],
                      center: Alignment.topRight,
                      radius: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
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
                        children: const [
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
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.pink),
                        height: 40,
                        width: 40,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.pink),
                        height: 40,
                        width: 40,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Add User',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
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
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.pink),
                        height: 40,
                        width: 40,
                        child: const Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => loginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.pinkAccent.shade700,
                  Colors.pinkAccent.shade400,
                  Colors.pink,
                  Colors.pink.shade400,
                  Colors.pink.shade300,
                  Colors.pink.shade200,
                  Colors.pink.shade100,
                  Colors.purple.shade100,
                  Colors.purple.shade200,
                  Colors.purple.shade300,
                  Colors.purple.shade400,
                  Colors.purple,
                  Colors.purpleAccent.shade400,
                  Colors.purpleAccent.shade700,
                  Colors.purpleAccent
                ],
                center: Alignment.topRight,
                radius: 2.5,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: cardName.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: Column(children: [
                                cardIcon[index],
                                const SizedBox(height: 5),
                                Text(
                                  cardName[index],
                                  style: const TextStyle(
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
        ),
      ),
    );
  }
}
