// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class compareLaptopScreen extends StatefulWidget {
  const compareLaptopScreen({Key? key}) : super(key: key);

  @override
  _compareLaptopScreenState createState() => _compareLaptopScreenState();
}

class _compareLaptopScreenState extends State<compareLaptopScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            getSearchField(),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(thickness: 3),
                ),
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment(0, 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(24, 72, 160, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "VS",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Divider(thickness: 3),
                ),
              ],
            ),
            SizedBox(height: 20),
            getSearchField(),
            SizedBox(height: 150),
            getButton(),
          ],
        ),
      ),
    );
  }

  Widget getSearchField() {
    var devices = ['HP Pavillion 15', 'Macbook Pro 2017', 'Lenovo Legion Y'];
    return SearchField(
      hint: "Search",
      searchInputDecoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 232, 232, 232),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(24, 72, 160, 1),
            width: 3.0,
          ),
        ),
      ),
      suggestions: devices
          .map((device) => SearchFieldListItem(device.toString(), item: device))
          .toList(),
    );
  }

  Widget getButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(24, 72, 160, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text("Compare"),
      ),
    );
  }
}
