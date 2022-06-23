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
        backgroundColor: Color.fromRGBO(24, 72, 160, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 232, 232, 232),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.laptop, size: 50),
                        Text(
                          device1,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 40,
                      height: 40,
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
                    Column(
                      children: [
                        Icon(Icons.laptop, size: 50),
                        Text(
                          device1,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
