import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

import '../dpHelper/mongodb.dart';

class findLaptopScreen extends StatefulWidget {
  const findLaptopScreen({Key? key}) : super(key: key);

  @override
  _findLaptopScreenState createState() => _findLaptopScreenState();
}

class _findLaptopScreenState extends State<findLaptopScreen>
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

  /*List<Map> companyList = [
    {"Company": "Apple", "isChecked": false},
    {"Company": "Google", "isChecked": false},
    {
      "Company": "HP",
      "isChecked": false,
    },
    {"Company": "Acer", "isChecked": false},
    {"Company": "Asus", "isChecked": false},
    {"Company": "Dell", "isChecked": false},
    {"Company": "Microsoft", "isChecked": false},
    {"Company": "Lenovo", "isChecked": false},
    {"Company": "Chuwi", "isChecked": false},
    {"Company": "MSI", "isChecked": false},
    {"Company": "Toshiba", "isChecked": false},
    {"Company": "Huawei", "isChecked": false},
    {"Company": "VERO", "isChecked": false},
    {"Company": "Mediacom", "isChecked": false},
    {"Company": "Razer", "isChecked": false},
    {"Company": "LG", "isChecked": false},
    {"Company": "Fujitsu", "isChecked": false},
  ]; */

  List<String> companyList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Add filter here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Company",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listCompanySelected) {
                    setState(() {
                      companyList = listCompanySelected;
                    });
                  },
                  options: const [
                    "Apple",
                    "Google",
                    "HP",
                    "Acer",
                    "Asus",
                    "Dell",
                    "Microsoft",
                    "Lenovo",
                    "Chuwi",
                    "MSI",
                    "Toshiba",
                    "Huawei",
                    "VERO",
                    "Mediacom",
                    "Razer",
                    "LG",
                    "Fujitsu",
                  ],
                  selectedValues: companyList,
                  whenEmpty: ' Select something',
                ),
                /*Text( //MODEL no perché è quello/quelli che si da in output dai filtri
                    "Model",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Type",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Inches",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Operation System",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Memory",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Screen resulution",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "RAM",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "CPU",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "GPU",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Price",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
