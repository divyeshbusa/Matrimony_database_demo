import 'package:final_matrimony/database/database.dart';
import 'package:final_matrimony/pages/add_user.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  String Name, phoneNo, CityName, DOB;
  int UserID;
  bool isFavourite;

  ProfileDetail(this.UserID, this.Name, this.phoneNo, this.CityName, this.DOB,
      this.isFavourite);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  DateTime SelectedDate = DateTime.now();
  MyDatabase db = MyDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail',
            style: TextStyle(color: Colors.pinkAccent),
          ),
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.pinkAccent,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/${widget.Name.toString()}.jpeg',
                      width: 200,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.Name.toString(),
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone No. : ${widget.phoneNo}',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'City Name : ${widget.CityName}',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Date Of Birth : ${widget.DOB}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'FAVOURITE : ',
                            style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.isFavourite = !widget.isFavourite;
                              });
                              print('::::::::::1!!!!${widget.isFavourite}');

                              db.favouriteUserFromUserTable(
                                  widget.UserID, !widget.isFavourite);

                              print('::::::::::2!!!!${widget.isFavourite}');
                            },
                            child: Icon(
                              widget.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.pinkAccent,
                              size: 28,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }

// String getFormateddate(dateToFormate) {
//
//   if (dateToFormate != null) {
//     return DateFormat('dd-MM-yyyy').format(dateToFormate).toString();
//   } else {
//     return DateFormat('dd-MM-yyyy').format(DateTime.now());
//   }
// }
}
