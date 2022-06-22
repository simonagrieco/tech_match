import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_match/screen/compareLaptop.dart';
import 'package:tech_match/screen/findLaptop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return DefaultTabController(
        length: 2,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 150,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    height: 220,
                  ),
                ],

              ),
              centerTitle: true,
              elevation: 4,
              backgroundColor: Colors.white,

              bottom: const TabBar(tabs: [
                Tab(
                    child: Text(
                      "Find",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.screen_search_desktop_outlined,
                      size: 25,
                      color: Colors.black,
                    )),
                Tab(
                    child: Text(
                      "Compare",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.compare_arrows_rounded,
                      size: 25,
                      color: Colors.black,
                    )),
              ]),
            ),
            body: const TabBarView(
              children: [
                findLaptopScreen(),
                compareLaptopScreen(),
              ],
            ),
          ),
        ));
  }
}
