import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                children: const <Widget>[
                  Text(
                    "Add filter here",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 60)),
                  Text(
                    "Company",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Model",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Pollici",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Screen resulution",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "CPU",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "GPU",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Memory",
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
