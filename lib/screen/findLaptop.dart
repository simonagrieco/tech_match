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
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
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
                  Row(
                    children: const [
                      Text(
                        "Company",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.home,
                        size: 25,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
