// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tech_match/dpHelper/MongoDBModel.dart';
import 'package:tech_match/dpHelper/mongodb.dart';
import 'package:tech_match/screen/comparator.dart';

class compareLaptopScreen extends StatefulWidget {
  const compareLaptopScreen({Key? key}) : super(key: key);

  @override
  _compareLaptopScreenState createState() => _compareLaptopScreenState();
}

class _compareLaptopScreenState extends State<compareLaptopScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController device1Controller = TextEditingController();
  TextEditingController device2Controller = TextEditingController();
  late List<String> devices = <String>[];
  var json;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    dataToList();
  }

  void dataToList() async {
    List<Map<String, dynamic>> json = await getDataFromDB();
    for (var element in json) {
      devices.add(element["Product"]);
    }
  }

  Future<List<Map<String, dynamic>>> getDataFromDB() async {
    json = await MongoDatabase.getData();
    return json;
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
          children: [
            getSearchField(device1Controller, "Device 1"),
            SizedBox(height: 20),
            getVsRow(),
            SizedBox(height: 20),
            getSearchField(device2Controller, "Device 2"),
            SizedBox(height: 70),
            getButton(),
          ],
        ),
      ),
    );
  }

  Widget getSearchField(TextEditingController controller, String name) {
    return SearchField(
      hint: name,
      controller: controller,
      searchInputDecoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 232, 232, 232),
        prefixIcon: Icon(Icons.laptop),
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
      itemHeight: 45,
      suggestionsDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Color.fromARGB(255, 232, 232, 232),
        ),
      ),
      suggestions: devices
          .map((device) => SearchFieldListItem(device, item: device))
          .toList(),
    );
  }

  Widget getButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          String device1 = device1Controller.text;
          String device2 = device2Controller.text;
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Comparator(
                device1: device1,
                device2: device2,
              ),
            ),
          ); */
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(24, 72, 160, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          "Compare",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget getVsRow() {
    return Row(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Divider(thickness: 3),
        ),
      ],
    );
  }
}
