import 'package:flutter/cupertino.dart';

class compareLaptopScreen extends StatefulWidget {
  const compareLaptopScreen({Key? key}) : super(key: key);

  @override
  _compareLaptopScreenState createState() => _compareLaptopScreenState();
}

class _compareLaptopScreenState extends State<compareLaptopScreen> with SingleTickerProviderStateMixin {
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
    return Container();
  }
}
