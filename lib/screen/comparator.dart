// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_match/dpHelper/mongodb.dart';

class Comparator extends StatefulWidget {
  final String device1;
  final String device2;

  const Comparator({
    Key? key,
    required this.device1,
    required this.device2,
  }) : super(key: key);

  @override
  State<Comparator> createState() => _ComparatorState();
}

class _ComparatorState extends State<Comparator> {
  late List firstDevice = [];
  late List secondDevice = [];
  var json1, json2;

  List<String> category = [
    "Company",
    "Product",
    "TypeName",
    "Inches",
    "ScreenResolution",
    "Cpu",
    "Ram",
    "Memory",
    "Gpu",
    "OpSys",
    "Price_euros"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comparator"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(24, 72, 160, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Divider(
                    thickness: 3,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          width: 120,
                          child: Text(
                            widget.device1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        Container(
                          padding: EdgeInsets.all(2),
                          width: 120,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.device2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                  Divider(
                    thickness: 3,
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Future.wait([
                  MongoDatabase.getDataByName(widget.device1),
                  MongoDatabase.getDataByName(widget.device2)
                ]),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return DisplayData(
                          category, snapshot.data![0], snapshot.data![1]);
                    } else {
                      return Center(
                        child: Text("Data not found."),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget DisplayData(List category, List device1, List device2) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: 11,
      itemBuilder: ((context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                margin: EdgeInsets.only(right: 10),
                height: 80,
                width: (MediaQuery.of(context).size.width / 3.8),
                child: Center(
                  child: Text(
                    device1[0][category[index]],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                margin: EdgeInsets.only(right: 10),
                width: (MediaQuery.of(context).size.width / 3.8),
                height: 80,
                child: Center(
                    child: Text(
                  category[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                width: (MediaQuery.of(context).size.width / 3.8),
                height: 80,
                child: Center(
                  child: Text(
                    device2[0][category[index]],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
