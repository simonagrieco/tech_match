// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tech_match/dpHelper/device.dart';
import 'package:tech_match/dpHelper/mongodb.dart';
import 'package:tech_match/screen/home.dart';

class Delete extends StatefulWidget {
  final String device;

  const Delete({Key? key, required this.device}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Delete"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(24, 72, 160, 1),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you sure?",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You are now deleting " + widget.device,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                SizedBox(
                  height: 80,
                ),
                getButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          MongoDatabase.delete(widget.device);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(24, 72, 160, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          "Delete",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
