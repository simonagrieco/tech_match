// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Comparator extends StatelessWidget {
  final String device1;
  final String device2;

  const Comparator({
    Key? key,
    required this.device1,
    required this.device2,
  }) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        width: 120,
                        child: Text(
                          device1,
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
                        child: Text(
                          device2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 3,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 11,
                itemBuilder: ((context, index) => Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 232, 232),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          margin: EdgeInsets.only(right: 10),
                          width: (MediaQuery.of(context).size.width / 3),
                          height: 80,
                          child: Center(child: Text("Company")),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 232, 232, 232),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          width: (MediaQuery.of(context).size.width / 2 - 10),
                          height: 80,
                          child: Center(child: Text("HP -- Lenovo")),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
