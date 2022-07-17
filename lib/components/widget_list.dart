import 'dart:io';

import 'package:flutter/material.dart';

class WidgetList extends StatelessWidget {
  final String product;
  final String company;
  final String typename;
  final String operSyst;
  final double inches;
  final String memory;
  //final String screenresolution;
  final String cpu;
  final String gpu;
  final String ram;
  final double price;

  WidgetList({
    required this.product,
    required this.company,
    required this.typename,
    required this.operSyst,
    required this.inches,
    required this.memory,
    required this.cpu,
    required this.gpu,
    required this.price,
    required this.ram,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Product: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$product",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Company: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$company",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Type: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$typename",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Inches: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$inches",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Operation System: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$operSyst",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Memory: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$memory",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("RAM: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$ram",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("GPU: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$gpu",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("CPU: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$cpu",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text("Price: ",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800],
                                        )),
                                    Text("$price",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[800],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
        ],
      );
  }
}
