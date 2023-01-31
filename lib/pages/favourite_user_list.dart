import 'package:final_matrimony/Models/user_list_model.dart';
import 'package:final_matrimony/database/database.dart';
import 'package:final_matrimony/pages/add_user.dart';
import 'package:final_matrimony/pages/profile_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteUser extends StatefulWidget {
  @override
  State<FavouriteUser> createState() => _FavouriteUserState();
}

class _FavouriteUserState extends State<FavouriteUser> {
  MyDatabase db = MyDatabase();
  UserModel modelU = UserModel(
      UserName1: 'Enter Name:',
      PhoneNo1: 000000,
      Cityid1: 0,
      Photo1: '',
      GenderID1: 0,
      IsFavourite1: false,
      DOB1: 'Select DOB');
  List<UserModel> localList = [];
  List<UserModel> searchList = [];
  bool isGetData = true;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    db.copyPasteAssetFileToRoot();
    db.initDatabase();
    controller.addListener(() {
      print('::::::::${controller.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          foregroundColor: Colors.pinkAccent,
          title: Row(
            children: [
              Text(
                'Favourite User',
                style: GoogleFonts.archivo(
                  color: Colors.pinkAccent,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade200,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder<List<UserModel>>(
              builder: (context, snapshot) {
                if (snapshot != null && snapshot.hasData) {
                  if (isGetData) {
                    localList.addAll(snapshot.data!);
                    searchList.addAll(localList);
                  }
                  isGetData = false;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(color: Colors.pinkAccent),
                        ),
                        child: TextField(
                          style:
                              TextStyle(color: Colors.pinkAccent, fontSize: 17),
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Search'),
                          controller: controller,
                          onChanged: (value) {
                            searchList.clear();
                            for (int i = 0; i < localList.length; i++) {
                              if (localList[i]
                                  .UserName
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                                searchList.add(localList[i]);

                                print(
                                    'SEARCHLIST::::LENGHTH::::${searchList.length}');
                                print(
                                    'LOCALLIST::::LENGHTH::::${localList[i]}');
                              }
                            }
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProfileDetail(
                                      searchList[index].UserID as int,
                                      searchList[index].UserName.toString(),
                                      searchList[index].PhoneNo.toString(),
                                      searchList[index].Cityid.toString(),
                                      searchList[index].DOB.toString(),
                                      searchList[index].IsFavourite,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 10,
                                shape: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Colors.pinkAccent, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            searchList[index]
                                                .UserName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Phone No. :${searchList[index].PhoneNo.toString()}',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2),
                                        ],
                                      ),
                                      Row(children: [
                                        InkWell(
                                          onTap: () {
                                            showAlertDialog(context, index);
                                          },
                                          child: Icon(
                                            Icons.delete_outline_outlined,
                                            color: Colors.red,
                                            size: 28,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              searchList[index].IsFavourite =
                                                  !searchList[index]
                                                      .IsFavourite;
                                            });
                                            print(
                                                '::::::::::1!!!!${searchList[index].IsFavourite}');
                                            db.favouriteUserFromUserTable(
                                                searchList[index].UserID,
                                                !searchList[index].IsFavourite);
                                            print(
                                                '::::::::::2!!!${searchList[index].IsFavourite}');
                                          },
                                          child: Icon(
                                            searchList[index].IsFavourite
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: Colors.pinkAccent,
                                            size: 28,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => AddUser(
                                                  model: searchList[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.mode_edit_outline_sharp,
                                            color: Colors.purpleAccent,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: searchList.length,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('USER NOT FOUND '),
                  );
                }
              },
              future: isGetData ? db.getDataOfFavouriteUser() : null),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, index) {
    Widget yesButton = TextButton(
      child: Text(
        "YES",
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () async {
        int deletedUserID =
            await db.deleteUserFromUserTable(searchList[index].UserID);
        print('localList::::::UserID:::::${deletedUserID}');
        print('localList::::::UserID:::::${searchList[index].UserID}');
        if (deletedUserID == searchList[index].UserID) {
          searchList.removeAt(index);
          print('localList::::::Index:::::${index}');
        }
        Navigator.of(context).pop();
        setState(() {});
      },
    );
    Widget noButton = TextButton(
      child: Text(
        "NO",
        style: TextStyle(color: Colors.pink),
      ),
      onPressed: () {
        print('localList::::::Index:::::${index}');
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.pink),
      ),
      content: Text("Are You Sure Want To Delete Data.",
          style: TextStyle(color: Colors.black)),
      actions: [
        yesButton,
        noButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForSuccess(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "Close",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.pinkAccent,
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      title: Text(
        "",
        style: TextStyle(color: Colors.white),
      ),
      content: Text("Detail Succesfully added.",
          style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
