import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_matrimony/Models/city_model.dart';
import 'package:final_matrimony/Models/gender_model.dart';
import 'package:final_matrimony/Models/user_list_model.dart';
import 'package:final_matrimony/database/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
  late UserModel? model;

  AddUser({required this.model});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isValid = true;
  CityModel modelC = CityModel(CityID1: -1, CityName1: 'Select City');
  UserModel modelU = UserModel(
      UserName1: 'Enter Name:',
      PhoneNo1: 000000,
      Cityid1: 0,
      Photo1: '',
      GenderID1: 0,
      IsFavourite1: false,
      DOB1: 'Select DOB');
  GenderModel modelG = GenderModel(GenderID1: 0, GenderType1: 'male');
  bool isGetCity = true;
  bool isGetGender = true;
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  MyDatabase myDatabase = MyDatabase();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.model != null ? widget.model!.UserName.toString() : '');

    phoneController = TextEditingController(
        text: widget.model != null ? widget.model!.PhoneNo.toString() : '');


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add User',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 25),
              ),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: FutureBuilder<List<CityModel>>(
                  builder: (context, snapshot) {
                    if (snapshot.data != null || snapshot.hasData) {
                      if (isGetCity) {
                        modelC = snapshot.data![0];
                      }

                      return DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          items: snapshot.data!
                              .map((item) => DropdownMenuItem<CityModel?>(
                                    value: item,
                                    child: Text(
                                      item.CityName.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: modelC,
                          onChanged: (value) {
                            setState(() {
                              isGetCity = false;
                              modelC = value!;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 20,
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                  future: isGetCity ? myDatabase.getCityListFromTbl() : null,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Text(
                    'Name : ',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                  ),
                  SizedBox(width: 31),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.pinkAccent),),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),

                        ),
                        validator: (value) {
                          if (value == null || value!.trim().length == 0) {
                            return 'Enter Valid Name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Text(
                    'Phone No : ',
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.pinkAccent),),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),

                        ),
                        validator: (value) {
                          if (value == null || value!.trim().length == 0) {
                            return 'Enter Valid PhoneNo.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: FutureBuilder<List<GenderModel>>(
                      builder: (context, snapshot) {
                        if (snapshot.data != null || snapshot.hasData) {
                          if (isGetGender) {
                            modelG = snapshot.data![0];
                          }

                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              items: snapshot.data!
                                  .map((item) => DropdownMenuItem<GenderModel?>(
                                        value: item,
                                        child: Text(
                                          item.GenderType.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pinkAccent,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: modelG,
                              onChanged: (value) {
                                setState(() {
                                  isGetGender = false;
                                  modelG = value!;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 20,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.black),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      future: isGetGender ? myDatabase.getGenderDetail() : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () => _pickDateDialog(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DATE OF BIRTH :',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                           getFormateddate(selectedDate),
                          style: TextStyle(fontSize: 20),
                        ),

                      ],
                    ),
                    // Text('Enter Valid date.')
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (modelG.GenderID == -1) {
                      print(':::::CALLING 1:::::::');
                      showAlertDialog(context);
                    } else {
                      print(':::::CALLING 2:::::::');
                      print(':::::GENDERID:::::::${modelU.Genderid}');
                      print(':::::CALLING 2:::::::${modelU.PhoneNo}');
                      myDatabase.upsertIntoUserTable(
                        UserId:
                            widget.model != null ? widget.model!.UserID : -1,
                        CityName: modelC.CityID,
                        UserName: nameController.text.toString(),
                        Gender: modelG.GenderID,
                        PhoneNo: phoneController.text.toString(),
                        dob: selectedDate.toString(),
                        isFavourite: false,
                      );
                      setState(() {});
                      Navigator.of(context).pop();

                    }
                  }
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.pinkAccent,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
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
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content:
          Text("Please Select City", style: TextStyle(color: Colors.white)),
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

  showAlertDialogForGender(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
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
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content:
          Text("Please Select Gender", style: TextStyle(color: Colors.white)),
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

  showAlertDialogfordate(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "OK",
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
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content: Text("Only 18 Year above is allowed.",
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

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (DateTime.now().difference(pickedDate!) < Duration(days: 6570)) {
        return showAlertDialogfordate(context);
      }
      setState(() {
        selectedDate = pickedDate!;
      });
    });
  }

  String getFormateddate(dateToFormate) {
    if (isValid) {}
    if (dateToFormate != null) {
      return DateFormat('dd-MM-yyyy').format(dateToFormate).toString();
    } else {
      return DateFormat('dd-MM-yyyy').format(DateTime.now());
    }
  }
}
